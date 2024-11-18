#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N_lowCmplx.fasta \
    -out_bad null \
    -lc_method entropy -lc_threshold 75 \
    -out_good ../results/filtered/filtered_len_N_lowCmplx2

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N_lowCmplx2.fasta \
    -out_good null -out_bad null \
    -graph_data ../results/filtered/filtered_len_N_lowCmplx2.gd

prinseq-graphs-noPCA.pl \
    -i ../results/filtered/filtered_len_N_lowCmplx2.gd \
    -o ../results/filtered/filtered_len_N_lowCmplx2_plots \
    -html_all \
    -log ../logs/filtered_len_N_lowCmplx2.log