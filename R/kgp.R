#' 1000 Genomes Project sample data (Expanded)
#'
#' Sample, pedigree, and population data for 3,202 samples in the expanded 1000 Genomes Project data.
#'
#' @format A tibble with 3202 rows and 11 columns:
#' \describe{
#'   \item{fid}{Family ID}
#'   \item{id}{Individual ID}
#'   \item{pid}{Paternal ID}
#'   \item{mid}{Maternal ID}
#'   \item{sex}{Sex (1=Male, 2=Female)}
#'   \item{sexf}{Sex as a factor}
#'   \item{pop}{Short population code}
#'   \item{reg}{Short region code}
#'   \item{population}{Long population description}
#'   \item{region}{Long region description}
#'   \item{phase3}{Logical; indicates whether this sample is included in the Phase 3 release data}
#' }
#' @source \url{http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/}
#' @references Byrska-Bishop, Marta, et al. "High-coverage whole-genome sequencing of the expanded 1000 Genomes Project cohort including 602 trios." Cell 185.18 (2022): 3426-3440.
#' @references 1000 Genomes Project Consortium. "A global reference for human genetic variation." Nature 526.7571 (2015): 68.
#' @references License information is available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}. The 1000 Genomes data is made publicly available according to the Fort Lauderdale Agreement (\url{https://www.genome.gov/Pages/Research/WellcomeReport0303.pdf}).
"kgpe"


#' 1000 Genomes Project sample data (Phase 3)
#'
#' Sample, pedigree, and population data for 2,504 samples in the Phase 3 release of the 1000 Genomes Project data.
#'
#' @format A tibble with 2504 rows and 10 columns:
#' \describe{
#'   \item{fid}{Family ID}
#'   \item{id}{Individual ID}
#'   \item{pid}{Paternal ID}
#'   \item{mid}{Maternal ID}
#'   \item{sex}{Sex (1=Male, 2=Female)}
#'   \item{sexf}{Sex as a factor}
#'   \item{pop}{Short population code}
#'   \item{reg}{Short region code}
#'   \item{population}{Long population description}
#'   \item{region}{Long region description}
#' }
#' @source \url{http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/}
#' @references Byrska-Bishop, Marta, et al. "High-coverage whole-genome sequencing of the expanded 1000 Genomes Project cohort including 602 trios." Cell 185.18 (2022): 3426-3440.
#' @references 1000 Genomes Project Consortium. "A global reference for human genetic variation." Nature 526.7571 (2015): 68.
#' @references License information is available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}. The 1000 Genomes data is made publicly available according to the Fort Lauderdale Agreement (\url{https://www.genome.gov/Pages/Research/WellcomeReport0303.pdf}).
"kgp3"

#' 1000 Genomes Project population metadata
#'
#' Population metadata from 26 populations across five continental regions.
#'
#' @format A tibble with 26 rows and 7 columns:
#' \describe{
#'   \item{pop}{Short population code}
#'   \item{reg}{Short region code}
#'   \item{population}{Long population description}
#'   \item{region}{Long region description}
#'   \item{regcolor}{Color for plotting this region on a map}
#'   \item{lat}{Population latitude}
#'   \item{lng}{Population longitude}
#' }
#' @source \url{http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/}
#' @references Byrska-Bishop, Marta, et al. "High-coverage whole-genome sequencing of the expanded 1000 Genomes Project cohort including 602 trios." Cell 185.18 (2022): 3426-3440.
#' @references 1000 Genomes Project Consortium. "A global reference for human genetic variation." Nature 526.7571 (2015): 68.
#' @references License information is available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}. The 1000 Genomes data is made publicly available according to the Fort Lauderdale Agreement (\url{https://www.genome.gov/Pages/Research/WellcomeReport0303.pdf}).
"kgpmeta"

#' 1000 Genomes, SGDP, HGDP, and GGVP metadata
#'
#' Population metadata from 212 populations from the 1000 Genomes Project (kgp), Simons Genome Diversity Project (sgdp), Human Genome Diversity Project (hgdp), and Gambian Genome Variation Project (ggvp).
#'
#' @format A tibble with 212 rows and 8 columns:
#' \describe{
#'   \item{pop}{Short population code}
#'   \item{reg}{Short region code}
#'   \item{population}{Long population description}
#'   \item{region}{Long region description}
#'   \item{regcolor}{Color for plotting this region on a map}
#'   \item{lat}{Population latitude}
#'   \item{lng}{Population longitude}
#'   \item{dataset}{Which dataset (kgp = 1000 Genomes Project; ggvp = Gambian Genome Variation Project; hgdp = Human Genome Diversity Project; Simons Genome Diversity Project).}
#' }
#' @references Byrska-Bishop, Marta, et al. "High-coverage whole-genome sequencing of the expanded 1000 Genomes Project cohort including 602 trios." Cell 185.18 (2022): 3426-3440.
#' @references 1000 Genomes Project Consortium. "A global reference for human genetic variation." Nature 526.7571 (2015): 68.
#' @references Clarke, Laura, et al. "The international Genome sample resource (IGSR): A worldwide collection of genome variation incorporating the 1000 Genomes Project data." Nucleic acids research 45.D1 (2017): D854-D859.
#' @references License information is available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}. The 1000 Genomes data is made publicly available according to the Fort Lauderdale Agreement (\url{https://www.genome.gov/Pages/Research/WellcomeReport0303.pdf}).
"allmeta"
