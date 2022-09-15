#!/bin/bash

G1='\033[0;32m'
G2='\033[0m'
R1='\033[0;31m'
R2='\033[0m'
fail=false
### $1 is the absolute path to input dataset. For example, data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fasta
####$2 is 1 if you need to download dataset, 0 otherwise
##Output: binned reads will appear in data/ONT folder


#DATASET=data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fasta

if $2; then
############INSTALL AWS##########################################
echo -e "\n${G1}installing aws s3 (for downloading datasets)${G2}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    -o "aws_cli_v2.zip" && \
    unzip aws_cli_v2.zip && \
    ./aws/install -i ./aws -b ./aws --update && \
    rm -f aws_cli_v2.zip || \
    fail=true
if $fail; then echo -e "\n${R1}aws s3 installation failed${R2}"; exit 1; else echo -e "${G1}AWS installed..!${G2}"; fi


##############Download publicly available ONT dataset from AWS ####
echo -e "\n${G1}downloading ONT data...${G2}"
aws/dist/aws s3 --no-sign-request cp s3://human-pangenomics/NHGRI_UCSC_panel/HG002/hpp_HG002_NA24385_son_v1/nanopore/downsampled/standard_unsheared/HG002_ucsc_Jan_2019_Guppy_3.4.4.fastq.gz data/ONT/ || fail=true
if $fail; then echo -e "\n${R1}ONT data download failed${R2}"; exit 1; else echo -e "${G1}ONT data is successfully downloaded!${G2}"; fi


#uncompress fastq.gz and convert toFASTA
echo -e "\n${G1}Decompresing ONT data and converting to FASTA...${G2}"
gunzip -c data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fastq.gz | awk '{if(NR%4==1) {printf(">%s\n",substr($0,2));} else if(NR%4==2) print;}' > data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fasta || fail=true;
rm -rf data/ONT/*gz;
if $fail; then echo -e "\n${R1}ONT data decompression an parsing into FASTA failed${R2}"; exit 1; else echo -e "${G1}ONT data is successfully decompressed and parsed into FASTA!${G2}"; fi

#############Download hg38 reference genome and mm2 index#######################
echo -e "\n${G1}downloading ONT data...${G2}"
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz || fail=true;
if $fail; then echo -e "\n${R1}hg38 refence download failed${R2}"; exit 1; else echo -e "${G1}hg38 reference is successfully downloaded!${G2}"; fi
gunzip -c GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz > data/hg38.fa || fail=true;
if $fail; then echo -e "\n${R1}hg38 reference decompression failed${R2}"; exit 1; else echo -e "${G1}hg38 reference is successfully decompressed!${G2}"; fi
bin/b2k -t 1 -x map-ont -d data/hg38.mmi data/hg38.fa || fail=ture;
if $fail; then echo -e "\n${R1}minimap2 index building step failed${R2}"; exit 1; else echo -e "${G1}hg38 reference index is succesfully built!${G2}"; fi
rm -rf GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz;

fi

#############Re-organize data into bins based on read length######
echo -e "\n${G1}re-organizing data into bins...${G2}"
python3 scripts/organize_data.py $1 || fail=true
sed -i '1d' data/ONT/*.fa;
if $fail; then echo -e "\n${R1}Re-organization of data failed${R2}"; exit 1; else echo -e "${G1}Reads are successfully re-organized into bins!${G2}"; fi



#############Pac-Bio data download###############################
#echo -e "\n${G1}downloading PacBio HiFi 15Kb data...${G2}"
#mkdir -p data/PB/
#aws/dist/aws s3 --no-sign-request cp s3://human-pangenomics/NHGRI_UCSC_panel/HG002/hpp_HG002_NA24385_son_v1/PacBio_HiFi/15kb/m64012_190920_173625.Q20.fastq data/PB/ || fail=true
#if $fail; then echo -e "\n${R1}PacBio HiFi 15Kb data download failed${R2}"; exit 1; else echo -e "${G1}done!${G2}"; fi


#echo -e "\n${G1}downloading PacBio HiFi 20Kb data...${G2}"
#aws/dist/aws s3 --no-sign-request cp s3://human-pangenomics/NHGRI_UCSC_panel/HG002/hpp_HG002_NA24385_son_v1/PacBio_HiFi/20kb/m64011_190830_220126.Q20.fastq data/PB/ || fail=true
#if $fail; then echo -e "\n${R1}PacBio HiFi 20Kb data download failed${R2}"; exit 1; else echo -e "${G1}done!${G2}"; fi
