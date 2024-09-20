#!/bin/bash

# CODES - PROJECT 1

#Directory creation
mkdir AMR_fighters
mkdir biocomputing && cd biocomputing
# Downloading files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna https://raw.githubusercontent.com/josoga
2/dataset-repos/main/wildtype.gbk https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
# Moving file from one directory to another
mv ~/biocomputing/wildtype.fna ~/AMR_fighters/
#Removing duplicate directory
rm wildtype.gbk.1
# Analysing if the file is mutant or wildtype
cd ..
cd AMR_fighters
grep -i "tatatata" wildtype.fna
# If mutant -> moving to new file
touch mutant.fna
grep "tatatata" wildtype.fna > mutant.fna

# Downloading a favorite genes fasta file from NCBI
#For ampC gene
mkdir fav_gene
cd fav_gene
wget "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=NC_002516.2&from=4594029&to=4595222&report=fasta&retmode=text" -O fav_gene.fasta
#For dnaK gene:
mkdir genes
cd genes
wget "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&id=NC_000913.3&from=12163&to=14079&report=fasta&retmode=text" -O dnaK.fasta

# Counting the number of lines in the fasta file - except accession number line
#For ampC gene
tail -n +2 fav_gene.fasta | wc -l
# Count of nucleotide occurance
A_count=$(tail -n +2 fav_gene.fasta | grep -o "A" | wc -l)
echo $A_count
G_count=$(tail -n +2 fav_gene.fasta | grep -o "G" | wc -l)
echo $G_count
C_count=$(tail -n +2 fav_gene.fasta | grep -o "C" | wc -l)
echo $C_count
T_count=$(tail -n +2 fav_gene.fasta | grep -o "T" | wc -l)
echo $T_count

#For dnaK gene:
grep -v “>” dnaK.fasta | wc -l
A=$(grep -v "^>" dnaK.fasta | grep -o "A" | wc -l)
echo $A
G=$(grep -v "^>" dnaK.fasta | grep -o "G" | wc -l)
echo $G
C=$(grep -v "^>" dnaK.fasta | grep -o "C" | wc -l)
echo $C
T=$(grep -v "^>" dnaK.fasta | grep -o "T" | wc -l)
echo $T

# Calculate GC content of the sequence
#For ampC gene:
GC_COUNT=$(tail -n +2 fav_gene.fasta | grep -o "[GC]" | wc -l)
Total_COUNT=$(tail -n +2 fav_gene.fasta | grep -o "[ATGC]" | wc -l)
sudo apt-get install bc
GC_content=$(echo "scale=2; ($GC_COUNT / $Total_COUNT) * 100" | bc)
echo $GC_COUNT0
echo $Total_COUNT
echo $GC_content "%"

#For dnaK gene:
GC=$((G+C))
echo $GC
total=$((G+C+A+T))
echo $total
$GC_content=$((GC * 100 / total))
echo GC_content "%"

# Creating a new .fasta file and appending the details
touch AMR_fighters.fasta
echo "AATGCGTACG" > AMR_fighters.fasta
echo "A_count: $(grep -o 'A' AMR_fighters.fasta | wc -l)" >> AMR_fighters.fasta 
echo "G_count: $(grep -o 'G' AMR_fighters.fasta | wc -l)" >> AMR_fighters.fasta 
echo "T_count: $(grep -o 'T' AMR_fighters.fasta | wc -l)" >> AMR_fighters.fasta 
echo "C_count: $(grep -o 'C' AMR_fighters.fasta| wc -l)" >> AMR_fighters.fasta


