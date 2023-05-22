#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N bam2fastqFull    #name of job
#$ -l h_rt=08:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G     #How much RAM is required
#$ -pe sharedmem 4  #how many cores?
#$ -e bam2fastqFull.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas 


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test
	

export PATH=/exports/eddie/scratch/s2268606/yard/cellranger-7.1.0:$PATH

#To be run in Ximerakis folder
#make directories for results

find ./bam_testing_to_be_removed -maxdepth 1 -name "*.bam.1" -print | xargs -I{} basename {} .bam.1 | sort | uniq > Ximerakis_BAM_names.txt

for B in $(cat Ximerakis_BAM_names.txt) ; do
	BAMNAME=$B
	mkdir ${BAMNAME}
	cellranger bamtofastq  ./bam_testing_to_be_removed/${BAMNAME}.bam.1 ./${BAMNAME}
done
