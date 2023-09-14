#!/usr/bin/sh
#$ -./Ximerakis/Data            #run in Ximerakis directory
#$ -N cellrangermultiqc
#$ -l h_rt=00:15:00             #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G                 #How much RAM is required
#$ -pe sharedmem 2              #added from previous version
#$ -e cellrangermultiqc.e       #where errors go
#$ -hold_jid Cellranger_genome  #wait until the preivous job is done


#This script runs multiqc on the Ximerakis reads generated in the previous script. Generates output for broad quality assessment.

#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test

#Folder to hold multiQc results
mkdir cellrangermultiQC

cp counts*/outs/*.html ./cellrangermultiQC

multiqc ./cellrangermultiQC -m cellranger -n cellrangerMultiQC
