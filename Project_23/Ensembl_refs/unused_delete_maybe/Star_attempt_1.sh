#!/usr/bin/sh
#$ -cwd #run in current working dir
#$ -N Star_a1_2268606 #name of job
#$ -l h_rt=05:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G #How much RAM is required
#$ -e star_a1.e #where errors go

#retrieve the files for generating genome indexes
#wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
#wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz

mkdir STAR_genome_mus_109 

module load roslin/star/2.7.10b

STAR --runThreadN 2 --runMode genomeGenerate --genomeDir ./STAR_genome_mus_109 --genomeFastaFiles *primary_assembly.fa.gz --sjdbGTFfile *gtf.gz --sjdbOverhang -149
