<div align="center">
  
![image](https://github.com/user-attachments/assets/e55501e8-1448-47df-99a7-19cd510cbd01)
</div>

<div align="center"> 
  
# **Stage 4: NGS Analysis Pipeline**
### Authors: Lakshana Bakthavachalam (@Lakshana) and Nada ElSayed Ahmed (@Nada_EA)
</div>


![image](https://github.com/user-attachments/assets/ad348f80-7067-4d6e-bc2b-2e973cc4f692)

---

## Table of Contents

1. Project Description
2. Resources
3. Required Tools (refer to a file named requirements.txt)
4. System Setup for the Pipeline (automated by setup.sh)
5. Running the NGS Pipeline (refer to the file script.sh)

---

## This stage of the HackBio internship included two tasks. 

In **task one**, we were required to create a simple NGS analysis pipeline for a single sample.
This included downloading the datasets (forward and reverse sample reads and reference genome), applying quality control check, trimming adapter content as well as poor-quality bases, aligning sample reads to the reference genome, and variant calling. 

- You can find the step by step process of this analysis in the "Single Pipeline" folder.

---

In **task two**, we were asked to expand the analysis we did to have an automated pipeline that can be applied to five samples.
We created three files:

## **"1. script.sh"**: This is the main pipeline script that automates the entire NGS analysis process.

It performs the following tasks:

1- Downloads samples read files and reference genome file.

2- Performs quality control on the raw data.

3- Trims the reads for adaptor content and poor-quality bases.

4- Maps the reads to the reference genome.

5- Converts the SAM files to BAM files, then sorts the produced BAM files.

6- Performs variant calling and generates VCF files.

## **"2. setup.sh"**: This script installs all the necessary tools required for the pipeline.
These include wget, fastqc, fastp, bwa, samtools, and bcftools. It ensures that your environment is ready for executing the script.sh.

## **"3. requirements.txt"**: 
This file lists all the software tools used in the project.

--- 

# Resources:
**1. Single sample NGS pipeline (Sample: ERR8774458):**
   
   Forward Strand: (https://zenodo.org/records/10426436/files/ERR8774458_1.fastq.gz?download=1)
   
   Reverse Strand: (https://zenodo.org/records/10426436/files/ERR8774458_2.fastq.gz?download=1)
   
   Reference genome: (https://zenodo.org/records/10886725/files/Reference.fasta?download=1)

   ***
   
    
**2. Automated NGS Pipleline (multiple samples):**

  - **ACBarrie**

    R1: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/ACBarrie_R1.fastq.gz
    
    R2: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/ACBarrie_R2.fastq.gz
    

  - **Alsen**
    
    R1: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Alsen_R1.fastq.gz
    
    R2: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Alsen_R2.fastq.gz

  - **Baxter**

    R1: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Baxter_R1.fastq.gz

    R2: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Baxter_R2.fastq.gz

  - **Chara**

    R1: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Chara_R1.fastq.gz

    R2: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Chara_R2.fastq.gz

  - **Drysdale**

    R1: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R1.fastq.gz

    R2: https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R2.fastq.gz
---

<div align="center">
  
## **End**
</div>
