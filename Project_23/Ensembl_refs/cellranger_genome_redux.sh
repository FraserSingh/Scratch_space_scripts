#!/usr/bin/sh

#$ -cwd             #run in current working dir
#$ -N Cellranger_genome_redux
#$ -l h_rt=12:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 3  #added from previous version
#$ -e Cellranger_genome_redux.e     #where errors go

export PATH=/exports/eddie/scratch/s2268606/yard/apps/cellranger-7.1.0:$PATH #fixme



#wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
#wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz

#cellranger mkgtf Mus_musculus.GRCm39.109.gtf Mus_musculus.GRCm39.109.filtered.gtf --attribute=gene_biotype:protein_coding #eliminate overlapping non-polyAtranscripts which overlap with protein-coding models

#Use the filtered gtf and the fasta assembly to generate the _redux reference genome for cr counts to use later
cellranger mkref --genome Cellranger_Mouse_genome_redux --fasta ./Mus_musculus.GRCm39.dna.primary_assembly.fa --genes Mus_musculus.GRCm39.109.filtered.gtf
