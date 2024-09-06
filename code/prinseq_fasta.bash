#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../data/MicroEco_probe_gene_database_ver2_cdhit100.fasta \
    -out_good null -out_bad null \
    -graph_data ../results/input_seq_qc/input_seq.gd

prinseq-graphs-noPCA.pl \
    -i ../results/input_seq_qc/input_seq.gd \
    -o ../results/input_seq_qc/plots \
    -html_all \
    -log ../logs/prinseq_graphs.log
