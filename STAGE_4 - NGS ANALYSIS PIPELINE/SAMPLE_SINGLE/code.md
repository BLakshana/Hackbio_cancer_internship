<!--StartFragment-->
<h2>
  SINGLE SAMPLE - NGS ANALYSIS
</h2>

**Create a directory and obtain the fasta sequence of the sample**

<kbd> *mkdir sample\_seq* </kbd>

<kbd> *curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_1.fastq.gz?download=1" -o forward.fastq.gz* </kbd>

<kbd> *curl -L "https\://zenodo.org/records/10426436/files/ERR8774458\_2.fastq.gz?download=1" -o reverse.fastq.gz* </kbd>

<kbd> *curl -L "https\://zenodo.org/records/10886725/files/Reference.fasta?download=1" -o reference.fasta* </kbd>

**Quality check of sample sequences using tool fastqc**

<kbd> _conda activate_ </kbd>

<kbd> _conda install -c bioconda fastqc_ </kbd>

<kbd> _fastqc sample\_seq/\*.fastq.gz -o qc\_sample/_ </kbd>

**Trim adapter seq from sample sequences using tool fastp**

<kbd> _conda install -c bioconda fastp_ </kbd>

<kbd> _mkdir trim\_sample_ </kbd>

<kbd> _fastp -i sample\_seq/forward.fastq.gz -o trim\_sample/forward\_trim.fastq.gz_ </kbd>

<kbd> _fastp -i sample\_seq/reverse.fastq.gz -o trim\_sample/reverse\_trim.fastq.gz_ </kbd>

<kbd> _fastp -i sample\_seq/forward.fastq.gz --html trim\_sample/forward\_trim\_fastp.html_ </kbd>

<kbd> _fastp -i sample\_seq/reverse.fastq.gz --html trim\_sample/reverse\_trim\_fastp.html_ </kbd>

**Repair disordered sequences and align them according to the reference genome and save it as a “.bam file” using tools bbtool, bwa and samtools**

<kbd> _conda install -c bioconda bbmap_ </kbd>

<kbd> _conda install -c bioconda bwa_ </kbd>

<kbd> _mkdir repaired\_sample_ </kbd>

<kbd> _repair.sh in1=trim\_sample/forward\_trim.fastq.gz in2=trim\_sample/reverse\_trim.fastq.gz out1=repaired\_sample/forward\_repair.fastq.gz out2=repaired\_sample/reverse\_repair.fastq.gz outsingle=repaired\_sample/repaired\_sample\_single.fastq.gz_ </kbd>

<kbd> _conda create -n samtools\_env -c bioconda samtools_ </kbd>

<kbd> _conda activate samtools\_env_ </kbd>

<kbd> _conda install -c bioconda htslib_ </kbd>

<kbd> _bwa index sample\_seq/reference.fasta_ </kbd>

<kbd> _mkdir alignment\_sample_ </kbd>

<kbd> _bwa mem -t 4 sample\_seq/reference.fasta repaired\_sample/forward\_repair.fastq.gz repaired\_sample/reverse\_repair.fastq.gz | samtools view -b > alignment\_sample/aligned.bam_ </kbd>

**Sort and index the aligned sequence**

<kbd> _samtools sort alignment\_sample/aligned.bam -o alignment\_sample/aligned\_sorted.bam_ </kbd>

<kbd> _samtools index alignment\_sample/aligned\_sorted.bam_ </kbd>

**Variant calling using tool bcftools**

<kbd> _conda install -c bioconda bcftools_ </kbd>

<kbd> _conda install -c conda-forge openblas_ </kbd>

<kbd> _mkdir variants_ </kbd>

<kbd> _bcftools mpileup -Ob -o variants/variant.bcf -f sample\_seq/reference.fasta alignment\_sample/aligned\_sorted.bam_ </kbd>

<kbd> _bcftools view -Ov -o variants/variant.vcf variants/variant.bcf_ </kbd>

***VCF FILE NOT INCLUDED IN OUTPUT DUE TO SIZE ISSUES (OVER 100MB)***
<!--EndFragment-->
