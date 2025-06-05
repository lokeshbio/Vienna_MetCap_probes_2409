#!/usr/bin/env bash


for i in {03..26};do
    ./MetCap.pl --Cutoff=0.9 \
        --Wsize=8 --Numprobe=4 \
        --GCmin=35 --GCmax=65 \
        --lmin=50 --Lmax=70 \
        --TMmax=57 --TMmin=55 \
        --Tempfile=NO --cons_cutoff=60 \
        --Infile='./Lokesh_run_for_Vienna_241121/fasta_files/fasta'$i
    mv './Lokesh_run_for_Vienna_241121/fasta_files/fasta'$i'.all_Probe_nr.txt' './Lokesh_run_for_Vienna_241121/final_probes/'
    mv './Lokesh_run_for_Vienna_241121/fasta_files/fasta'$i'.probe_run2_summary' './Lokesh_run_for_Vienna_241121/logs/'
    rm ./Lokesh_run_for_Vienna_241121/fasta_files/*.*
    rm ./Lokesh_run_for_Vienna_241121/fasta_files/*_*
done