#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N FastQC_Ximerakis_revised
#$ -l h_rt=12:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 6  #added from previous version
#$ -e FastQC_Ximerakis_2.e     #where errors go


#analysis script, takes .fastq.gz and creates report, then uses multiqc to create overall report too


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test

#perform in Ximerakis
cd /exports/eddie/scratch/s2268606/External_datasets/Ximerakis/
mkdir ./revised_fastq


fastqc ./OX*/*/* -t 6 -o ./revised_fastq --noextract
fastqc ./YX*/*/* -t 6 -o ./revised_fastq --noextract


#run multiqc
multiqc ./revised_fastq -o .

