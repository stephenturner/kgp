# https://github.com/igsr/1000Genomes_data_indexes
# http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/

library(readr)
library(dplyr)

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
  kgp %>%
  filter(phase3) %>%
  select(-phase3) %>%
  assertr::verify(nrow(.)==2504L)

# Verify that there are no relatives
kgp3 %>%
  filter(mid %in% kgp3$id | pid %in% kgp3$id) %>%
  assertr::verify(nrow(.)==0L)

usethis::use_data(kgpe, kgp3, kgpmeta, internal=TRUE, overwrite = TRUE)
