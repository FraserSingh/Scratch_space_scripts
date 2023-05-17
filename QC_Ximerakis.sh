#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N FastQC_Ximerakis
#$ -l h_rt=12:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 6  #added from previous version
#$ -e FastQC_Ximerakis_1.e     #where errors go
#$ -hold_jid stageinFRS_QC

#analysis script, takes .fastq.gz and creates report, then uses multiqc to create overall report too


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test

#perform in Ximerakis
cd /exports/eddie/scratch/s2268606/Project_space/Ximerakis
mkdir fastqc_merged

find ./Dumped -maxdepth 1 -name "*.fastq.gz"  -print|sort|uniq >filelist.txt

for F in $(cat filelist.txt) ; do

        FULLSTRING=$F
        fastqc  ${FULLSTRING} -t 20  -o ./fastqc_merged
done

#run multiqc
multiqc ./fastqc_merged -o .
