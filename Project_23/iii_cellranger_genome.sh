#!/usr/bin/sh
#$ -./Ximerakis/Data    #run in Ximerakis directory
#$ -N Cellranger_genome
#$ -l h_rt=12:00:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=8G     #How much RAM is required
#$ -pe sharedmem 3  #added from previous version
#$ -e Cellranger_genome.e     #where errors go
#$ -hold_jid bam2fastqFull	#wait until the preivous job is done


#This script creates a reference genome for cellranger counts to use in the next script. 
#The reference is cutom-made to provide up-to-date gene annotations, but without overlapping non-pol-A annotations which cause multimapping in cellranger counts and read discarding
#See https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_mr#filter:~:text=primary_assembly.fa.gz-,Filter%20the%20GTF,mapped%2C%20they%20are%20not%20counted.%20See%20these%20resources%20for%20further%20information%3A,-Check%20for%20multi

#Add cellranger to the system's executable path

export PATH=../../cellranger-7.1.0:$PATH

#retrieve the genome annotations and assembly used in my version of the project
wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz


#Make the filtered annotations, without 'non-polyA transcripts that overlap with protein-coding gene models'
cellranger mkgtf Mus_musculus.GRCm39.109.gtf Mus_musculus.GRCm39.109.filtered.gtf --attribute=gene_biotype:protein_coding

#Make the custom refernece genome
cellranger mkref --genome Cellranger_Mouse_genome --fasta ./Mus_musculus.GRCm39.dna.primary_assembly.fa --genes Mus_musculus.GRCm39.109.filtered.gtf
