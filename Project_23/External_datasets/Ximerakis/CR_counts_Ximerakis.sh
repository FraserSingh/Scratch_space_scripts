#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N ximerakis_CR_counts    #name of job
#$ -l h_rt=30:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 3  #how many cores?
#$ -e ximerakis_CR_counts.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas  #notify if job begins, ends, aborts or suspends


#Run in Ximerakis (directory above Dumped/*fastq.gz )

#Grant access to cellranger
export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH #fixme

#Make .txt to use filenames
find ./Dumped -maxdepth 1 -name "*.fastq.gz" -print | xargs -I{} basename {} .fastq.gz | sort | uniq > Ximerakis_CR_files.txt


#run for loop to run cellranger for each sample in Ximerakis folder (16 samples)

for F in $(cat Ximerakis_CR_files.txt) ; do

        FULLSTRING=$F 
	cellranger count --id= ${FULLSTRING}_CR \ #without the fastq.gz file extension or pathname
   	--fastqs= /exporteddie/scratch/s2268606/Project_23/External_datasets/Ximerakis/Dumped/ 
   	--sample= ${FULLSTRING} \ #This --sample argument works off of the sample id at the beginning of the FASTQ file name so this will be the SRA sample number in the file name
   	--transcriptome= /exports/eddie/scratch/s2268606/Project_23/Ensembl_refs/Cellranger_Mouse_genome/ 

done
