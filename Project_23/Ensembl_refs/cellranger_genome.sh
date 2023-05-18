#!/usr/bin/sh

#$ -cwd             #run in current working dir
#$ -N Cellranger_genome
#$ -l h_rt=12:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 3  #added from previous version
#$ -e Cellranger_genome.e     #where errors go

export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH #fixme

cellranger mkref --genome Cellranger_Mouse_genome --fasta ./Mus_musculus.GRCm39.dna.primary_assembly.fa --genes Mus_musculus.GRCm39.109.gtf
