#$ -cwd #run in current working dir
#$ -N fastq_dumping #name of job
#$ -l h_rt=24::00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=32G #How much RAM is required
#$ -e fastq_dump.e #where errors go
#S -o fastq_dump.o #where the output goes


#grant Eddie access to my conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test


#Convert folders to fastq hopefully!
fasterq-dump ./SRR* -O ./Dumped
