#!/usr/bin/env bash

python ./filter_blast.py \
    -i ../results/filtered_vs_silva_rrna.blastn.tab \
    -p 50 -l 50 \
    -o ../results/blast_results_subset.tsv

perl ./filter_sequences.pl \
    ../results/blast_results_subset.tsv \
    ../results/filtered_for_rRNA_screen.fasta \
    ../results/filtered_after_rRNA_screen.fasta