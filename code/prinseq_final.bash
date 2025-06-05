#!/usr/bin/env bash

prinseq-lite.pl \
    -fasta ../results/final_probes_file.fna \
    -out_good null -out_bad null \
    -graph_data ../results/final_probes_qc/final_probes_qc.gd

prinseq-graphs-noPCA.pl \
    -i ../results/final_probes_qc/final_probes_qc.gd \
    -o ../results/final_probes_qc/plots \
    -html_all \
    -log ../logs/final_probes_qc_graphs.log