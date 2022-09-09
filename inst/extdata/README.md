Code to download the data used in data-raw/kgp.R to create the package data:

```sh
cd inst/extdata
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/20131219.populations.tsv
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/20131219.superpopulations.tsv
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20200731.ALL.ped
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20130502.ALL.panel
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/20140625_related_individuals.txt
wget -Nq http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/20130606_g1k_3202_samples_ped_population.txt
```
