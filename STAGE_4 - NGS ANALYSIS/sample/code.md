<!--StartFragment-->

**Create a directory and obtain the fasta sequence of the sample**

-> *mkdir sample\_seq*

-> *curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_1.fastq.gz?download=1" -o forward.fastq.gz*

-> *curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_2.fastq.gz?download=1" -o reverse.fastq.gz*

-> *curl -L "https\://zenodo.org/records/10886725/files/Reference.fasta?download=1" -o reference.fasta*

**Quality check of sample sequences using tool fastqc**

-> _conda activate_

-> _conda install -c bioconda fastqc_

-> _fastqc sample\_seq/\*.fastq.gz -o qc\_sample/_

**Trim adapter seq from sample sequences using tool fastp**

-> _conda install -c bioconda fastp_

-> _mkdir trim\_sample_

-> _fastp -i sample\_seq/forward.fastq.gz -o trim\_sample/forward\_trim.fastq.gz_

-> _fastp -i sample\_seq/reverse.fastq.gz -o trim\_sample/reverse\_trim.fastq.gz_

-> _fastp -i sample\_seq/forward.fastq.gz --html trim\_sample/forward\_trim\_fastp.html_

-> _fastp -i sample\_seq/reverse.fastq.gz --html trim\_sample/reverse\_trim\_fastp.html_

**Repair disordered sequences and align them according to the reference genome and save it as a “.bam file” using tools bbtool, bwa and samtools**

-> _conda install -c bioconda bbmap_

-> _conda install -c bioconda bwa_

-> _mkdir repaired\_sample_

-> _repair.sh in1=trim\_sample/forward\_trim.fastq.gz in2=trim\_sample/reverse\_trim.fastq.gz out1=repaired\_sample/forward\_repair.fastq.gz out2=repaired\_sample/reverse\_repair.fastq.gz outsingle=repaired\_sample/repaired\_sample\_single.fastq.gz_

-> _conda create -n samtools\_env -c bioconda samtools_

-> _conda activate samtools\_env_

-> _conda install -c bioconda htslib_

-> _bwa index sample\_seq/reference.fasta_

-> _bwa mem -t 4 sample\_seq/reference.fasta repaired\_sample/forward\_repair.fastq.gz repaired\_sample/reverse\_repair.fastq.gz | samtools view -b > alignment\_sample/aligned.bam_

**Sort and index the aligned sequence**

-> _samtools sort alignment\_sample/aligned.bam -o alignment\_sample/aligned\_sorted.bam_

-> _samtools index alignment\_sample/aligned\_sorted.bam_

**Variant calling using tool bcftools**

-> _conda install -c bioconda bcftools_

-> _conda install -c conda-forge openblas_

-> _bcftools mpileup -Ob -o variants/variant.bcf -f sample\_seq/reference.fasta alignment\_sample/aligned\_sorted.bam_

-> _bcftools view -Ov -o variants/variant.vcf variants/variant.bcf_

***VCF FILE NOT INCLUDED IN OUTPUT DUE TO SIZE ISSUES (OVER 100MB)***
<!--EndFragment-->
