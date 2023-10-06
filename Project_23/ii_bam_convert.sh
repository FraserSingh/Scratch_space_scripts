#!/usr/bin/sh
#$ -./Ximerakis/Data    #run in Ximerakis directory
#$ -N bam2fastqFull    #name of job
#$ -l h_rt=08:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G     #How much RAM is required
#$ -pe sharedmem 4  #how many cores?
#$ -e bam2fastqFull.e     #where errors go
#$ -hold_jid bamRetrieve	#wait until the preivous job is done


#This script converts the bam files for the Ximerakis paper into fastq files for count generation in the next script

#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test
	
#Add cellranger to the system's executable path
#uncomment if the previously updated path has not updated to allow cellranger to be used!
#export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH

#To be run in Ximerakis folder
#make directories for results

find ./ -maxdepth 2 -name "*.bam.1" -print | xargs -I{} basename {} .bam.1 | sort | uniq > Ximerakis_BAM_names.txt

for B in $(cat Ximerakis_BAM_names.txt) ; do
	BAMNAME=$B
	cellranger bamtofastq  ./${BAMNAME}.bam.1 ./${BAMNAME}
done