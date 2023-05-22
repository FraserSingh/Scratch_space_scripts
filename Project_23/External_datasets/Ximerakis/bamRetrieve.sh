#!/usr/bin/bash
#$ -cwd             #run in current working dir
#$ -N bamRetrieve    #name of job
#$ -l h_rt=00:30:00 #approximate time taken, (specify more than required for safety)
#$ -l h_vmem=16G     #How much RAM is required
#$ -pe sharedmem 2  #how many cores?
#$ -e bamRetrieve.e     #where errors go
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas


urls=(
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895038/OX1X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895023/OX2X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895024/OX3X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895025/OX4X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895026/OX5X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895027/OX6X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895028/OX7X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895029/OX8X.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895030/YX1L.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895031/YX2L.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895032/YX3R.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895033/YX4R.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895034/YX5R.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895035/YX6L.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895036/YX7R.bam.1"
    "https://sra-pub-src-1.s3.amazonaws.com/SRR8895037/YX8L.bam.1"
)

for url in "${urls[@]}"; do
    filename=$(basename "$url")
    echo "Downloading $filename..."
    wget "$url"
    echo "Download complete!"
    echo
done
