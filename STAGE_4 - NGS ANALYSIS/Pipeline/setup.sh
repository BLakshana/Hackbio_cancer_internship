#!/bin/bash

# Bioconda channel
conda config --add channels bioconda

# Environment and packages
ENV1="Quality_control"
ENV1_PACKAGE=("fastqc" "multiqc" "fastp")

ENV2="Genome_mapping"
ENV2_PACKAGE=("bbmap" "bwa" "samtools")

ENV3="Variant_calling"
ENV3_PACKAGE=("bcftools")

create_env_install_package() {
    local ENV_NAME=$1
    shift
    local PACKAGES=("$@")

    echo "Creating Conda environment: $ENV_NAME with packages: ${PACKAGES[*]}..."
    conda create -y --name "$ENV_NAME" -c bioconda "${PACKAGES[@]}"

    echo "Environment '$ENV_NAME' created successfully!"
}

create_env_install_package "$ENV1" "${ENV1_PACKAGE[@]}"
create_env_install_package "$ENV2" "${ENV2_PACKAGE[@]}"
create_env_install_package "$ENV3" "${ENV3_PACKAGE[@]}"

echo "Environments '$ENV1''$ENV2' and '$ENV3' have been created with their respective packages."
