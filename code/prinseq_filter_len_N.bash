#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../data/MicroEco_probe_gene_database_ver2_cdhit100.fasta \
    -out_bad null \
    -derep 14 \
    -ns_max_n 0 \
    -min_len 100 \
    -out_good ../results/filtered/filtered_len_N

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N.fasta \
    -out_good null -out_bad null \
    -graph_data ../results/filtered/filtered_len_N.gd

prinseq-graphs-noPCA.pl \
    -i ../results/filtered/filtered_len_N.gd \
    -o ../results/filtered/filtered_len_N_plots \
    -html_all \
    -log ../logs/filtered_len_N_graphs.log