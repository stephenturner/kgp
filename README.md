
<!-- README.md is generated from README.Rmd. Please edit that file -->

# kgp

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/kgp)](https://CRAN.R-project.org/package=kgp)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![arXiv](https://img.shields.io/badge/arXiv-2210.00539-b31b1b.svg)](https://arxiv.org/abs/2210.00539)
<!-- badges: end -->

This kgp data package provides metadata about populations and data about
samples from the 1000 Genomes Project, including the 2,504 samples
sequenced for the Phase 3 release and the expanded collection of 3,202
samples with 602 additional trios.

## Installation

You can install the released version of kgp from
[CRAN](https://CRAN.R-project.org/package=kgp) with:

``` r
install.packages("kgp")
```

You can install the development version of kgp from
[GitHub](https://github.com/stephenturner/kgp) with:

``` r
# install.packages("devtools")
devtools::install_github("stephenturner/kgp")
```

## About the data

The 1000 Genomes Project data Phase 3 data contains 2,504 samples with
sequence data available, and was later expanded to 3,202 samples with
high coverage adding 602 trios. Data is available through the [1000
Genomes FTP site](http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/) and
[GitHub](https://github.com/igsr/1000Genomes_data_indexes/).

-   Pilot publication: [An integrated map of genetic variation from
    1,092 human genomes](https://www.nature.com/articles/nature11632)
-   Phase 1 publication: [A map of human genome variation from
    population scale
    sequencing](https://www.nature.com/articles/nature09534)
-   Phase 3 publication: [A global reference for human genetic
    variation](https://www.nature.com/articles/nature15393)
-   Expanded high-coverage publication: [High-coverage whole-genome
    sequencing of the expanded 1000 Genomes Project cohort including 602
    trios](https://pubmed.ncbi.nlm.nih.gov/36055201/)

There are three data sets available in the kgp package.

``` r
library(kgp)
data(kgp)
```

The `kgp3` data contains pedigree and population information for the
2,504 samples included in the Phase 3 release of the 1000 Genomes
Project data.

``` r
kgp3
#> # A tibble: 2,504 × 10
#>    fid     id      pid   mid     sex sexf   pop   reg   population        region
#>    <chr>   <chr>   <chr> <chr> <int> <fct>  <chr> <chr> <chr>             <chr> 
#>  1 HG00096 HG00096 0     0         1 male   GBR   EUR   British in Engla… Europe
#>  2 HG00097 HG00097 0     0         2 female GBR   EUR   British in Engla… Europe
#>  3 HG00099 HG00099 0     0         2 female GBR   EUR   British in Engla… Europe
#>  4 HG00100 HG00100 0     0         2 female GBR   EUR   British in Engla… Europe
#>  5 HG00101 HG00101 0     0         1 male   GBR   EUR   British in Engla… Europe
#>  6 HG00102 HG00102 0     0         2 female GBR   EUR   British in Engla… Europe
#>  7 HG00103 HG00103 0     0         1 male   GBR   EUR   British in Engla… Europe
#>  8 HG00105 HG00105 0     0         1 male   GBR   EUR   British in Engla… Europe
#>  9 HG00106 HG00106 0     0         2 female GBR   EUR   British in Engla… Europe
#> 10 HG00107 HG00107 0     0         1 male   GBR   EUR   British in Engla… Europe
#> # … with 2,494 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

The `kgpe` data contains pedigree and population information all 3,202
samples included in the expanded 1000 Genomes Project data, which
includes 602 trios.

``` r
kgpe
#> # A tibble: 3,202 × 11
#>    fid     id      pid   mid     sex sexf   pop   reg   population region phase3
#>    <chr>   <chr>   <chr> <chr> <int> <fct>  <chr> <chr> <chr>      <chr>  <lgl> 
#>  1 HG00096 HG00096 0     0         1 male   GBR   EUR   British i… Europe TRUE  
#>  2 HG00097 HG00097 0     0         2 female GBR   EUR   British i… Europe TRUE  
#>  3 HG00099 HG00099 0     0         2 female GBR   EUR   British i… Europe TRUE  
#>  4 HG00100 HG00100 0     0         2 female GBR   EUR   British i… Europe TRUE  
#>  5 HG00101 HG00101 0     0         1 male   GBR   EUR   British i… Europe TRUE  
#>  6 HG00102 HG00102 0     0         2 female GBR   EUR   British i… Europe TRUE  
#>  7 HG00103 HG00103 0     0         1 male   GBR   EUR   British i… Europe TRUE  
#>  8 HG00105 HG00105 0     0         1 male   GBR   EUR   British i… Europe TRUE  
#>  9 HG00106 HG00106 0     0         2 female GBR   EUR   British i… Europe TRUE  
#> 10 HG00107 HG00107 0     0         1 male   GBR   EUR   British i… Europe TRUE  
#> # … with 3,192 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

The `kgpmeta` contains population metadata for the 26 populations across
five continental regions.

``` r
kgpmeta
#> # A tibble: 26 × 7
#>    pop   population                          reg   region   regco…¹   lat    lng
#>    <chr> <chr>                               <chr> <chr>    <chr>   <dbl>  <dbl>
#>  1 CDX   Chinese Dai in Xishuangbanna, China EAS   East As… #778500  22   101.  
#>  2 CHB   Han Chinese in Bejing, China        EAS   East As… #778500  39.9 116.  
#>  3 JPT   Japanese in Tokyo, Japan            EAS   East As… #778500  35.7 140.  
#>  4 KHV   Kinh in Ho Chi Minh City, Vietnam   EAS   East As… #778500  10.8 107.  
#>  5 CHS   Southern Han Chinese, China         EAS   East As… #778500  23.1 113.  
#>  6 BEB   Bengali in Bangladesh               SAS   South A… #c44cfd  23.7  90.4 
#>  7 GIH   Gujarati Indian in Houston,TX       SAS   South A… #c44cfd  29.8 -95.4 
#>  8 ITU   Indian Telugu in the UK             SAS   South A… #c44cfd  52.5  -1.89
#>  9 PJL   Punjabi in Lahore,Pakistan          SAS   South A… #c44cfd  31.6  74.4 
#> 10 STU   Sri Lankan Tamil in the UK          SAS   South A… #c44cfd  52.5  -1.89
#> # … with 16 more rows, and abbreviated variable name ¹​regcolor
#> # ℹ Use `print(n = ...)` to see more rows
```

## Examples

``` r
library(dplyr)
library(ggplot2)
library(kgp)
data(kgp)
```

``` r
kgp3 %>% 
  count(region)
#> # A tibble: 5 × 2
#>   region         n
#>   <chr>      <int>
#> 1 Africa       661
#> 2 America      347
#> 3 East Asia    504
#> 4 Europe       503
#> 5 South Asia   489
```

``` r
kgp3 %>% 
  count(region, population)
#> # A tibble: 26 × 3
#>    region  population                                      n
#>    <chr>   <chr>                                       <int>
#>  1 Africa  African Ancestry in Southwest US               61
#>  2 Africa  African Caribbean in Barbados                  96
#>  3 Africa  Esan in Nigeria                                99
#>  4 Africa  Gambian in Western Division, The Gambia       113
#>  5 Africa  Luhya in Webuye, Kenya                         99
#>  6 Africa  Mende in Sierra Leone                          85
#>  7 Africa  Yoruba in Ibadan, Nigeria                     108
#>  8 America Colombian in Medellin, Colombia                94
#>  9 America Mexican Ancestry in Los Angeles, California    64
#> 10 America Peruvian in Lima, Peru                         85
#> # … with 16 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

``` r
kgp3 %>% 
  count(region, population) %>% 
  arrange(region, n) %>% 
  mutate(population=forcats::fct_inorder(population)) %>% 
  ggplot(aes(population, n)) + 
  geom_col(aes(fill=region)) + 
  labs(fill=NULL, x=NULL, x="N") + 
  coord_flip() + 
  theme_bw() + 
  theme(legend.position="bottom")
```

<img src="man/figures/README-kgp3barplot-1.png" width="100%" />
