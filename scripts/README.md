### What are these scripts?
**get_SRR.sh** - Input NCBI PRJNA accession number and get csv of associated SRA runs. Searches for SRR numbers and saves in 2bRAD files and ITS2 files.
<br>*Packages needed*: -entrez-direct
<br>
<br>**download_size.sh** - Input file of SRR numbers and get total download size needed
<br>*Packages needed*: -ncbi-vdb
<br>
<br>**fastqer.sh** - Use csv containing SRR numbers (one per row) and download fastq files
<br>*Packages needed*: -parallel-fastq-dump
