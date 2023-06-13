#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N CRcountsFull    #name of job
#$ -l h_rt=48:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G     #How much RAM is required
#$ -pe sharedmem 8  #how many cores?
#$ -e CRcountsFull.e #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas  #notify if job begins, ends, aborts or suspends
#$ -hold_jid bam2fastqFull


# Make the job resubmit itself if it runs out of time
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm


#Run in Ximerakis

#Grant access to cellranger
export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH #fixme


#Run cellranger count on each fastq generated by bamtofastq
for FASTQ in $(cat Ximerakis_BAM_names.txt) ; do
	cellranger count --id=cr${FASTQ} --fastqs=./${FASTQ} --transcriptome=/exports/eddie/scratch/s2268606/Project_23/Ensembl_refs/Cellranger_Mouse_genome/
done
