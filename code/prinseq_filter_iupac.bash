#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N.fasta \
    -out_bad ../results/filtered/iupac_sequences \
    -noniupac \
    -out_good ../results/filtered/filtered_len_N_iupac

prinseq-lite.pl \
    -fasta ../results/filtered/iupac_sequences.fasta \
    -out_good null -out_bad null \
    -graph_data ../results/filtered/iupac_sequences.gd

prinseq-graphs-noPCA.pl \
    -i ../results/filtered/iupac_sequences.gd \
    -o ../results/filtered/iupac_sequences_plots \
    -html_all \
    -log ../logs/iupac_sequences.log