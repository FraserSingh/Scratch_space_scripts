#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N CR_counts_new    #name of job
#$ -l h_rt=48:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=12G     #How much RAM is required
#$ -pe sharedmem 3  #how many cores?
#$ -e CR_counts_new.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas  #notify if job begins, ends, aborts or suspends



# Make the job resubmit itself if it runs out of time: rsync will start where it left off
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm


#Run in Ximerakis (directory above Dumped/*fastq.gz )

#Grant access to cellranger
export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH #fixme

#Make .txt to use filenames
find ./Dumped -maxdepth 1 -name "*.fastq.gz" -print | xargs -I{} basename {} .fastq.gz | tee Ximerakis_CR_names.txt | sed -E 's/SRR([0-9]+)_.*/SRR\1/' | sort | uniq > Ximerakis_CR_files.txt


#run for loop to run cellranger for each sample in Ximerakis folder (16 samples)

for F in $(cat Ximerakis_CR_files.txt) ; do

        FULLSTRING=$F 
	cellranger count --id=cr${FULLSTRING} --fastqs=/exports/eddie/scratch/s2268606/Project_23/External_datasets/Ximerakis/Dumped/  --sample=${FULLSTRING}  --transcriptome=/exports/eddie/scratch/s2268606/Project_23/Ensembl_refs/Cellranger_Mouse_genome/

done
