#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N bam2fastq    #name of job
#$ -l h_rt=05:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G     #How much RAM is required
#$ -pe sharedmem 3  #how many cores?
#$ -e bam2fastq.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas 


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test
	

export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH

cellranger bamtofastq  ./bam_testing_to_be_removed/OX2X.bam.1 ./bam_testing_to_be_removed/SRR8895023
