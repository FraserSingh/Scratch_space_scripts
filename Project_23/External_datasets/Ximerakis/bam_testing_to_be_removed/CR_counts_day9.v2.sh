#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N CRcountsDay9    #name of job
#$ -l h_rt=05:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=12G     #How much RAM is required
#$ -pe sharedmem 6  #how many cores?
#$ -e CRcountsDay9.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas  #notify if job begins, ends, aborts or suspends



# Make the job resubmit itself if it runs out of time
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm


#Run in bam_testing_to_be_removed

#Grant access to cellranger
export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH #fixme


#Run cellranger count on a single fastq folder
cellranger count --id=SRR_23_test --fastqs=./SRR8895023 --transcriptome=/exports/eddie/scratch/s2268606/Project_23/Ensembl_refs/Cellranger_Mouse_genome/

