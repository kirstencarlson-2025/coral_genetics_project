#!/bin/bash
# This script will read a previously created list of SRR numbers associated with NCBI accession and download each fastq file into 
# a designated output directory. It will also record the number of SRR numbers succesfully downloaded - this should match your
# original file to double check all was downloaded correctly.
# Needed:
# - parallel-fastq-dump

SRR_LIST="$1"   # Input file of SRR numbers, one per line
OUTDIR="$2"     # Specify the name of the output directory to save files to
LOGFILE="$3"    # The file to record SRR numbers successfully downloaded. This should match your original file.

# Create directory to save output files in
mkdir -p "$OUTDIR"

# Clear the log file to start
> "$LOGFILE"

# Loop through each accession
while read -r SRR; do
        # Downloads file into the output directory
        if fasterq-dump "$SRR" -o "$OUTDIR/${SRR}.fastq"; then
        # If successful, prints the SRR name to the log file
                echo "$SRR" | tee -a "$LOGFILE"
        else
                echo "Failed to download $SRR" | tee -a "$LOGFILE"
        fi
done < "$SRR_LIST"

# Compare number of successful downloads to input SRR list
SUCCESS=$(wc -l < "$LOGFILE")
TOTAL=$(wc -l < "$SRR_LIST")

echo "Downloaded $SUCCESS out of $TOTAL SRRs."

if [ "$SUCCESS" -eq "$TOTAL" ]; then
    echo "All SRRs downloaded successfully!"
else
    echo "Some SRRs failed. Check the log."
fi

test
