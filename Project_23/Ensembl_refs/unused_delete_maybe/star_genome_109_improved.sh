#!/bin/sh
#$ -N STAR_assembly
#$ -cwd
#$ -l h_rt=4:00:00
#$ -l h_vmem=8G
#$ -pe sharedmem 6


# Initialise the environment modules
. /etc/profile.d/modules.sh

module load igmm/apps/STAR/2.7.1a

mkdir STAR_genome
# set reference genome for STAR
STAR --runThreadN 6 \
	--runMode genomeGenerate \
	--genomeDir STAR_genome \
	--genomeFastaFiles *primary_assembly.fa.gz \
	--sjdbGTFfile *.gtf.gz --sjdbOverhang 149

