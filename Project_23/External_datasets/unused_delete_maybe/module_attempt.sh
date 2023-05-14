#!/usr/bin/sh
#$ -cwd #run in current working dir
#$ -N bioconda_test #name of job
#$ -l h_rt=0:01:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=2G #How much RAM is required
#$ -e bioconda_test.e #where errors go
#S -o bioconda_test.o #where the output goes

source /etc/profile.d/modules.sh

module load anaconda/5.3.1

source activate project_test

conda install -c bioconda sra-tools
conda list --name project_test

fastq-dump --stdout -X 2 SRR390728
