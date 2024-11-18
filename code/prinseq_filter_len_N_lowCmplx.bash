#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N.fasta \
    -out_bad null \
    -lc_method dust -lc_threshold 5 \
    -out_good ../results/filtered/filtered_len_N_lowCmplx

prinseq-lite.pl \
    -fasta ../results/filtered/filtered_len_N_lowCmplx.fasta \
    -out_good null -out_bad null \
    -graph_data ../results/filtered/filtered_len_N_lowCmplx.gd

prinseq-graphs-noPCA.pl \
    -i ../results/filtered/filtered_len_N_lowCmplx.gd \
    -o ../results/filtered/filtered_len_N_lowCmplx_plots \
    -html_all \
    -log ../logs/filtered_len_N_lowCmplx.log