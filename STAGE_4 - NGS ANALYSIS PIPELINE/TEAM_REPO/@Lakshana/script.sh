#!/bin/bash

# Enivronment and packages
bash setup.sh
conda install -c conda-forge openblas

# Creating directories 
mkdir sequences qc_sequences trimmed_sequences repaired_sequences aligned_sequences variants_of_sequences

# Downloading sample
SAMPLES=("ACBarrie" "Alsen" "Baxter" "Chara" "Drysdale")
curl -L https://raw.githubusercontent.com/josoga2/yt-dataset/main/dataset/raw_reads/reference.fasta -o sequences/Reference.fasta

for SAMPLE in "${SAMPLES[@]}";do
    curl -L https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${SAMPLE}_R1.fastq.gz -o sequences/${SAMPLE}_forward.fastq.gz
    curl -L https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${SAMPLE}_R2.fastq.gz -o sequences/${SAMPLE}_reverse.fastq.gz
done

echo SEQUENCES DOWNLOAD COMPLETED
rm sequences/_forward.fastq.gz
rm sequences/_reverse.fastq.gz

# Source the Conda setup
source "/home/laksh18b/miniconda3/etc/profile.d/conda.sh"

# Quality control
conda activate Quality_control
# Fastqc
fastqc -i sequences/*_forward.fastq.gz -o qc_sequences/
fastqc -i sequences/*_reverse.fastq.gz -o qc_sequences/
# Trimming
for file in sequences/*_forward.fastq.gz; do
    fastp -i "$file" -o "trimmed_sequences/$(basename "$file" .fastq.gz)_trimmed.fastq.gz"
done

for file in sequences/*_reverse.fastq.gz; do
    fastp -i "$file" -o "trimmed_sequences/$(basename "$file" .fastq.gz)_trimmed.fastq.gz"
done

conda deactivate

# Source the Conda setup
source "/home/laksh18b/miniconda3/etc/profile.d/conda.sh"

# Genome Mapping
conda activate Genome_mapping
bwa index sequences/Reference.fasta
# Repairing
for file in trimmed_sequences/*_forward_trimmed.fastq.gz; do
    # Define reverse 
    reverse_file="${file/_forward/_reverse}"
    
    # Extract the base sample name
    sample_name=$(basename "$file" _forward_trimmed.fastq.gz)
    
    # Repair.sh 
    repair.sh in1="$file" in2="$reverse_file" \
        out1="repaired_sequences/${sample_name}_forward_repaired.fastq.gz" \
        out2="repaired_sequences/${sample_name}_reverse_repaired.fastq.gz" \
        outsingle="repaired_sequences/${sample_name}_single.fastq.gz"
done
# Aligning
for file in repaired_sequences/*_forward_repaired.fastq.gz; do
    # Define reverse 
    reverse_file="${file/_forward/_reverse}"
    
    # Extract the base sample name
    sample_name=$(basename "$file" _forward_repaired.fastq.gz)

    # Align
    bwa mem -t 4 sequences/Reference.fasta repaired_sequences/${sample_name}_forward_repaired.fastq.gz repaired_sequences/${sample_name}_reverse_repaired.fastq.gz | samtools view -b > aligned_sequences/${sample_name}_aligned.bam
done
# Sorting
for file in aligned_sequences/*_aligned.bam; do
    # Extract the base sample name
    sample_name=$(basename "$file" _aligned.bam)

    # Sort
    samtools sort "$file" -o aligned_sequences/${sample_name}_align_sorted.bam
done

# Indexing
samtools index aligned_sequences/*_align_sorted.bam

conda deactivate

# Source the Conda setup
source "/home/laksh18b/miniconda3/etc/profile.d/conda.sh"

# Variant calling
conda activate Variant_calling
for file in aligned_sequences/*_align_sorted.bam; do
    # Extract the base sample name
    sample_name=$(basename "$file" _align_sorted.bam)
    # Variant calling
    bcftools mpileup -Ob -o variants_of_sequences/${sample_name}_variant.bcf -f sequences/Reference.fasta "$file"
done

for file in variants_of_sequences/*_variant.bcf; do
    # Extract the base sample name
    sample_name=$(basename "$file" _variant.bcf)
    #bcf to vcf
    bcftools view -Ov -o variants_of_sequences/${sample_name}_variant.vcf "$file"
done

conda deactivate
echo PROCESS COMPLETED