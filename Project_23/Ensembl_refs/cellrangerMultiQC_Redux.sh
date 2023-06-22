#!/usr/bin/sh
#$ -cwd             #run in current working dir
#$ -N cellrangermultiqcRedux
#$ -l h_rt=00:15:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 2  #added from previous version
#$ -e cellrangermultiqc_Redux.e     #where errors go
#$ -hold_jid CRcountsRedux


#activate conda env
source /etc/profile.d/modules.sh
module load anaconda/5.3.1
source activate multiqc_update

mkdir cellrangermultiQC_Redux



for sample in $(cat Ximerakis_BAM_names.txt) ; do cp Redux${sample}/outs/*web_summary* ./multiqc_redux/${sample}web_summary.html; done

multiqc ./multiqc_redux/ -m cellranger -n cellrangerMultiQC_Redux


echo "script ran"

