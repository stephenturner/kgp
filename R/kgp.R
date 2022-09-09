#' 1000 Genomes Project sample data (Expanded)
#'
#' Sample, pedigree, and population information for 3,202 samples in the expanded 1000 Genomes Project data.
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
#' @references License information available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}
"kgpe"


#' 1000 Genomes Project sample data (Phase 3)
#'
#' Sample, pedigree, and population information for 2,504 samples in the Phase 3 release of the 1000 Genomes Project data.
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
#' @references License information available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}
"kgp3"

#' 1000 Genomes Project population metadata
#'
#' Population metadata from 26 populations across five continental regions.
#'
#' @format A tibble with 26 rows and 4 columns:
#' \describe{
#'   \item{pop}{Short population code}
#'   \item{reg}{Short region code}
#'   \item{population}{Long population description}
#'   \item{region}{Long region description}
#' }
#' @source \url{http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/}
#' @references Byrska-Bishop, Marta, et al. "High-coverage whole-genome sequencing of the expanded 1000 Genomes Project cohort including 602 trios." Cell 185.18 (2022): 3426-3440.
#' @references 1000 Genomes Project Consortium. "A global reference for human genetic variation." Nature 526.7571 (2015): 68.
#' @references License information available at \url{https://github.com/igsr/1000Genomes_data_indexes/blob/master/LICENSE}
"kgpmeta"