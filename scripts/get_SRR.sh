#!/bin/bash
# WHAT: uses entrez-direct package to search for SRA runs using PRJNA accession number, then saves in csv file.
# Searches for SRR numbers and saves in seperate 2bRAD and ITS2 files
# Packages needed:
# - entrez-direct

# Set variables
PRJNA=$1     #PRJNA accession number
OUTPUT=$2    #output file name .csv

# fetch data
esearch -db sra -query $PRJNA | efetch -format runinfo > $OUTPUT

# Save SRR numbers in seperate 2bRAD and ITS2 files
grep 2bRAD $OUTPUT | cut -f1 -d "," | grep SRR > 2bRAD_$OUTPUT
grep ITS2 $OUTPUT | cut -f1 -d "," | grep SRR > ITS2_$OUTPUT
