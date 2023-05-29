#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N Sample_FastQC_Ximerakis
#$ -l h_rt=02:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 6  #added from previous version
#$ -e Sample_FastQC_Ximerakis.e     #where errors go


#analysis script, takes .fastq.gz and creates report, then uses multiqc to create overall report too


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test

#perform in Ximerakis
cd /exports/eddie/scratch/s2268606/External_datasets/Ximerakis/
mkdir ./Samples_fastqc

for sample in $(cat Ximerakis_BAM_names.txt) ; do
	samplename=$sample

	fastqc ./${samplename}/*/*fastq.gz -t 6 -o ./Samples_fastqc --noextract

done

#run multiqc
multiqc ./Samples_fastqc -o . -n samples_multiqc.html

