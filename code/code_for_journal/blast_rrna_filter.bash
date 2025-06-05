#!/bin/bash
# This script performs a BLAST search against the SILVA rRNA database
blastn -db ./BLASTDB/silva_rrna_all \
    -query ./filtered_for_rRNA_screen.fasta \
    -evalue 1e-25 -outfmt 7 -num_threads 16 -perc_identity 50 \
    -out filtered_vs_silva_rrna.blastn.tab

# This script filters the BLAST results based on match with 50% identity and length of 50 bases
python ./filter_blast.py \
    -i ../results/filtered_vs_silva_rrna.blastn.tab \
    -p 50 -l 50 \
    -o ../results/blast_results_subset.tsv

# This script filters the sequences based on the BLAST results from above
perl ./filter_sequences.pl \
    ../results/blast_results_subset.tsv \
    ../results/filtered_for_rRNA_screen.fasta \
    ../results/filtered_after_rRNA_screen.fasta