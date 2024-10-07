#!/bin/bash

#1 Update 
sudo apt update

#2 Download required tools
sudo apt install -y wget fastqc fastp bwa samtools bcftools	 #-y is to automatically choose "Yes" during installing

echo "All required tools are now available!"

