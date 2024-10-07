#!/bin/bash


#Create directories
mkdir -p raw
mkdir -p reference 
mkdir -p qc_report
mkdir -p trimmed
mkdir -p mapped
mkdir -p bcf_vcf

#Define Reference
REF="reference/reference.fasta"

#Loading & Indexing Reference
wget -O reference/reference.fasta "https://raw.githubusercontent.com/josoga2/yt-dataset/main/dataset/raw_reads/reference.fasta"
bwa index $REF

#Define Samples
Samples=("ACBarrie" "Alsen" "Baxter" "Chara" "Drysdale")

#For Loop through samples

for Sample in "${Samples[@]}"; do
	echo "$Sample in progress..."

	#1 Load samples forward and reverse reads
	wget -O raw/${Sample}_R1.fastq.gz "https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${Sample}_R1.fastq.gz"
	wget -O raw/${Sample}_R2.fastq.gz "https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${Sample}_R2.fastq.gz"

	#2 Quality control
	fastqc raw/${Sample}_R1.fastq.gz raw/${Sample}_R2.fastq.gz -o qc_report


	#3 Trimming
	fastp -i raw/${Sample}_R1.fastq.gz -I raw/${Sample}_R2.fastq.gz -o trimmed/${Sample}_R1_trimmed.fastq.gz -O trimmed/${Sample}_R2_trimmed.fastq.gz

	#4 Genome mapping
	bwa mem $REF trimmed/${Sample}_R1_trimmed.fastq.gz trimmed/${Sample}_R2_trimmed.fastq.gz > mapped/${Sample}.sam

	#5 SAM to BAM, Sorting the BAM file, & Indexing sample
	samtools view -bS mapped/${Sample}.sam -o mapped/${Sample}.bam
	samtools sort mapped/${Sample}.bam -o mapped/${Sample}_sorted.bam
	samtools index mapped/${Sample}_sorted.bam

	#6 Piling up & Variant calling
	bcftools mpileup -f $REF mapped/${Sample}_sorted.bam > bcf_vcf/${Sample}_piled.bcf
	bcftools call --ploidy 1 -m -v -o bcf_vcf/${Sample}_variants.vcf bcf_vcf/${Sample}_piled.bcf

	echo "${Sample} is done."
done 

echo "All samples are done!"
