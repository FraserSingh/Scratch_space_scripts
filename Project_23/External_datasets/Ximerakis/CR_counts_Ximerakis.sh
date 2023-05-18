#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N ximerakis_CR_counts    #name of job
#$ -l h_rt=15:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 3  #how many cores?
#$ -e ximerakis_CR_counts.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas  #notify if job begins, ends, aborts or suspends


#Run in Ximerakis (directory above Dumped/*fastq.gz )

#Make filename to use .txt?

#!/bin
find ./Dumped -maxdepth 1 -name "*.fastq.gz"  -print|sort|uniq >Ximerakis_CR_files.txt


#run for loop to run cellranger for each sample in Ximerakis folder (16 samples)

for F in $(cat Ximerakis_CR_files.txt) ; do

        FULLSTRING=$F #do the name filtering here
        fastqc  ${FULLSTRING} -t 20  -o ./fastqc_merged

cellranger count --id=  \ #needs to be FULLSTRING without the fastq.gz file extension, 
   --fastqs= /mnt/home/user.name/yard/run_cellranger_count/pbmc_1k_v3_fastqs \
   --sample= pbmc_1k_v3 \ #This --sample argument works off of the sample id at the beginning of the FASTQ file name so this will be the SRA sample number in the file name
   --transcriptome= /mnt/home/user.name/yard/run_cellranger_count/refdata-gex-GRCh38-2020-A

done
