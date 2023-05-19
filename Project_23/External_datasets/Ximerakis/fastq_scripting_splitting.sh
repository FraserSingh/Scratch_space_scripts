#$ -cwd #run in current working dir
#$ -N fastq_dumping_splitting #name of job
#$ -l h_rt=24:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=12G #How much RAM is required
#$ -e fastq_dump_splitting.e #where errors go
#$ -pe sharedmem 3
#S -o fastq_dump_splitting.o #where the output goes
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas 

#grant Eddie access to my conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate project_test


#Convert folders to fastq hopefully!
fastq-dump --split-files --gzip ./SRR* -O ./Dumped/split

