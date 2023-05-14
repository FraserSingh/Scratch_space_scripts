#!/usr/bin/sh
#$ -cwd #run in current working dir
#$ -N ext_data_prep_2268606 #name of job
#$ -l h_rt=36:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=32G #How much RAM is required
#$ -e ext_data_prep.e #where errors go
#S -o ext_data_prep.o #where the output goes

source /etc/profile.d/modules.sh 

# Check amount of memory (in kbytes) as seen by the job
ulimit -v

#Conda setup?
module load anaconda/5.3.1

#Setting up env with SRA tools
source activate project_test

#Getting data from studies
#make a folder for both studies
mkdir -p Slota_etal_paper/Original_data_Slota_etal; mkdir -p Ximerakis_etal_paper/Original_data_Ximerakis_etal

#Download the data from respective sources
#Slota
cd Slota_etal_paper/Original_data_Slota_etal
prefetch -type fastq GSE129788 #doesn't work on Eddie for some reason 

cd ../..
