#!/usr/bin/sh
#$ -cwd #run in current working dir
#$ -N Star_a5 #name of job
#$ -l h_rt=04:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G #How much RAM is required
#$ -pe sharedmem 6 #added from previous version
#$ -e star_a4.e #where errors go

#retrieve the files for generating genome indexes
#wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
#wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz

source /etc/profile.d/modules.sh

# Check amount of memory (in kbytes) as seen by the job
ulimit -v

#mkdir STAR_genome_mus_109
module load roslin/star/2.7.10b

STAR --runThreadN 6 --runMode genomeGenerate --genomeDir ./STAR_genome_mus_109_a5 --genomeFastaFiles *primary_assembly.fa --sjdbGTFfile *gtf --sjdbOverhang -149
