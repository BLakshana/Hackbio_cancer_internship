<!--StartFragment-->

\# Create a directory and obtain the fasta sequence of the sample

- mkdir sample\_seq

- curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_1.fastq.gz?download=1" -o forward.fastq.gz

- curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_2.fastq.gz?download=1" -o reverse.fastq.gz

- curl -L "https\://zenodo.org/records/10886725/files/Reference.fasta?download=1" -o reference.fasta

\# Quality check of sample sequences using tool fastqc

- conda activate

* conda install -c bioconda fastqc

* fastqc sample\_seq/\*.fastq.gz -o qc\_sample/

\# Trim adapter seq from sample sequences using tool fastp

- conda install -c bioconda fastp

- mkdir trim\_sample

- fastp -i sample\_seq/forward.fastq.gz -o trim\_sample/forward\_trim.fastq.gz

- fastp -i sample\_seq/reverse.fastq.gz -o trim\_sample/reverse\_trim.fastq.gz

- fastp -i sample\_seq/forward.fastq.gz --html trim\_sample/forward\_trim\_fastp.html

- fastp -i sample\_seq/reverse.fastq.gz --html trim\_sample/reverse\_trim\_fastp.html

\# Repair disordered sequences and align them according to the reference genome and save it as a “.bam file” using tools bbtool, bwa and samtools

- conda install -c bioconda bbmap

- conda install -c bioconda bwa

- mkdir repaired\_sample

- repair.sh in1=trim\_sample/forward\_trim.fastq.gz in2=trim\_sample/reverse\_trim.fastq.gz out1=repaired\_sample/forward\_repair.fastq.gz out2=repaired\_sample/reverse\_repair.fastq.gz outsingle=repaired\_sample/repaired\_sample\_single.fastq.gz

- conda create -n samtools\_env -c bioconda samtools

- conda activate samtools\_env

- conda install -c bioconda htslib

- bwa index sample\_seq/reference.fasta

- bwa mem -t 4 sample\_seq/reference.fasta repaired\_sample/forward\_repair.fastq.gz repaired\_sample/reverse\_repair.fastq.gz | samtools view -b > alignment\_sample/aligned.bam

\# Sort and index the aligned sequence

- samtools sort alignment\_sample/aligned.bam -o alignment\_sample/aligned\_sorted.bam

- samtools index alignment\_sample/aligned\_sorted.bam

\# Variant calling using tool bcftools

- conda install -c bioconda bcftools

- conda install -c conda-forge openblas

- bcftools mpileup -Ob -o variants/variant.bcf -f sample\_seq/reference.fasta alignment\_sample/aligned\_sorted.bam

- bcftools view -Ov -o variants/variant.vcf variants/variant.bcf

<!--EndFragment-->
