# https://github.com/igsr/1000Genomes_data_indexes
# http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(stringr)
})

# Get 1000 Genomes Population metadata
kgpmeta <-
  inner_join(
    system.file("extdata", "20131219.populations.tsv", package="kgp", mustWork=TRUE) %>%
      read_tsv(col_types="ccc------") %>%
      select(pop=`Population Code`, population=`Population Description`, reg=`Super Population`) %>%
      filter(!is.na(pop) & !is.na(population) & !is.na(reg)),
    system.file("extdata", "20131219.superpopulations.tsv", package="kgp", mustWork=TRUE) %>%
      read_tsv(col_types="cc") %>%
      select(reg=`Population Code`, region=`Description`),
    by="reg") %>%
  assertr::verify(nrow(.)==26L)
# Make consistent with sgdp and hgdp
kgpmeta <-
  kgpmeta %>%
  mutate(region=str_replace_all(region, c(
    "^African$"="Africa",
    "^American$"="America",
    "^East Asian$"="East Asia",
    "^European$"="Europe",
    "^South Asian$"="South Asia"
  )))


# Get the Ped file from the 3202 sample set
ped <-
  system.file("extdata", "20130606_g1k_3202_samples_ped_population.txt", package="kgp", mustWork=TRUE) %>%
  read_table(col_types="ccccicc") %>%
  rlang::set_names(c("fid", "id", "pid", "mid", "sex", "pop", "reg")) %>%
  assertr::verify(nrow(.)==3202)

# Get the sample IDs from the phase 3 data
phase3ids <-
  system.file("extdata", "integrated_call_samples_v3.20130502.ALL.panel", package="kgp", mustWork=TRUE) %>%
  read_lines(skip=1) %>%
  trimws() %>%
  gsub("\\t.*", "", .) %>%
  rlang::set_names(.) %>%
  assertr::verify(length(.)==2504L) %>%
  unname()

# Create the combined/annotated data
kgpe <-
  ped %>%
  inner_join(kgpmeta, by=c("pop", "reg")) %>%
  mutate(phase3=id %in% phase3ids) %>%
  mutate(sexf=factor(sex, labels=c("male", "female")), .after=sex) %>%
  assertr::verify(sum(phase3)==2504L) %>%
  assertr::verify(nrow(.)==3202L)

# Filter that down to just the phase 3 samples
kgp3 <-
  kgpe %>%
  filter(phase3) %>%
  select(-phase3) %>%
  assertr::verify(nrow(.)==2504L)

# Verify that there are no relatives
stopifnot(nrow(filter(kgp3, mid %in% kgp3$id | pid %in% kgp3$id))==0L)

# From internationalgenome.org/api/beta/population/_search/igsr_populations.tsv
allmeta <-
  read_tsv(here::here("inst/extdata/igsr_populations.tsv"), col_types="ccccddcccic") %>%
  janitor::clean_names()
# Get relevant cols
allmeta <-
  allmeta %>%
  transmute(pop=ifelse(is.na(population_code), population_elastic_id, population_code),
            population=population_description,
            reg=ifelse(is.na(superpopulation_code), superpopulation_name, superpopulation_code),
            region=superpopulation_name,
            regcolor=superpopulation_display_colour,
            lat=population_latitude,
            lng=population_longitude,
            dataset=data_collections)
# Start consolidating regions/population names
allmeta <-
  allmeta %>%
  mutate(reg=str_replace_all(reg, c(
    "Central South Asia"="CSA",
    "Africa"="AFR",
    "Europe"="EUR",
    "America"="AMR",
    "East Asia"="EAS",
    "South Asia"="SAS",
    "Africa"="AFR",
    "Central Asia and Siberia"="CAS",
    "Middle East"="MDE",
    "West Eurasia"="WEU",
    "Oceania"="OCE"))) %>%
  mutate(across(c(reg, region), str_remove_all, " \\([SH]GDP\\)")) %>%
  mutate(across(where(is.character), trimws))
# Consolidate dataset names
allmeta <-
  allmeta %>%
  mutate(dataset=str_replace_all(dataset, "1000 Genomes.*", "kgp")) %>%
  mutate(dataset=str_replace_all(dataset, "Gambian Genome Variation Project.*", "ggvp")) %>%
  mutate(dataset=str_replace_all(dataset, "Simons.*", "sgdp")) %>%
  mutate(dataset=str_replace_all(dataset, "HGDP.*|Human Genome Diversity Project", "hgdp"))
# Replace kgp population, reg, region with what's already in kgpmeta
allmeta <-
  allmeta %>%
  left_join(kgpmeta %>% select(pop, population, reg, region), by=c("pop"), suffix=c("", ".kgp")) %>%
  mutate(population=ifelse(!is.na(population.kgp), population.kgp, population)) %>%
  mutate(reg=ifelse(!is.na(reg.kgp), reg.kgp, reg)) %>%
  mutate(region=ifelse(!is.na(region.kgp), region.kgp, region)) %>%
  select(-ends_with(".kgp"))
# Consolidate region names
allmeta <-
  allmeta %>%
  mutate(region=str_replace_all(region, c(
    "^African Ancestry$|^African$"="Africa",
    "^American$"="America",
    "^East Asian$"="East Asia",
    "^European$"="Europe",
    "^South Asian$"="South Asia"
    ))) %>%
  mutate(region=trimws(region))
# Single color per region
allmeta <-
  allmeta %>%
  arrange(reg, desc(dataset=="kgp")) %>%
  group_by(reg) %>%
  mutate(regcolor=first(regcolor)) %>%
  ungroup()
# Checks
stopifnot(
  identical(n_distinct(allmeta$reg), n_distinct(allmeta$region)),
  identical(n_distinct(allmeta$reg), n_distinct(allmeta$regcolor)),
  identical(n_distinct(allmeta$pop), n_distinct(allmeta$population)),
  all(kgpmeta$reg %in% allmeta$reg),
  all(kgpmeta$region %in% allmeta$region),
  all(kgpmeta$pop %in% allmeta$pop),
  all(kgpmeta$population %in% allmeta$population),
  all(allmeta$reg[allmeta$dataset=="kgp"] %in% kgpmeta$reg),
  all(allmeta$region[allmeta$dataset=="kgp"] %in% kgpmeta$region),
  all(allmeta$pop[allmeta$dataset=="kgp"] %in% kgpmeta$pop),
  all(allmeta$population[allmeta$dataset=="kgp"] %in% kgpmeta$population)
)

# Add in lat/lon/color information for kgpmeta
kgpmeta <-
  kgpmeta %>%
  inner_join(allmeta, by = c("pop", "population", "reg", "region")) %>%
  select(-dataset) %>%
  assertr::verify(nrow(.)==nrow(kgpmeta))

usethis::use_data(kgpe, kgp3, kgpmeta, allmeta, internal=TRUE, overwrite = TRUE)
