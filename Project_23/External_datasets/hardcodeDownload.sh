#!/usr/bin/sh
#$ -cwd #run in current working dir
#$ -N hardcode_download #name of job
#$ -l h_rt=36:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=32G #How much RAM is required
#$ -e hardcodeDownload.e #where errors go
#S -o hardcodeDownload..o #where the output goes

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

wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895023
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895024/SRR8895024
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895025
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895026
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895027
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895028
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895029
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895030
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895031
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895032
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895033
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895034
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895035
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895036
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895037
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR8895023/SRR8895038

fastq-dump --gzip SRR8895023 SRR8895024 SRR8895025 SRR8895026 SRR8895027 SRR8895028 SRR8895029 SRR8895030 SRR8895031 SRR8895032 SRR8895033 SRR8895034 SRR8895035 SRR8895036 SRR8895037 SRR8895038 

cd ../..
