#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N cellrangermultiqc
#$ -l h_rt=02:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 2  #added from previous version
#$ -e cellrangermultiqc_new.e     #where errors go


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate multiqc_update

mkdir cellrangermultiQC

cp cr*/outs/*.html ./cellrangermultiQC

multiqc ./cellrangermultiQC -m cellranger -n cellrangerMultiQC

rm -rf cellrangermultiQC

echo "script ran"

