#!/bin/bash -l
#SBATCH -A naiss2024-22-1147
#SBATCH -p shared -n 16
#SBATCH -J blast
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=lokeshwaran.manoharan@nbis.se
#SBATCH --output=blast_rrna.out
#SBATCH --error=blast_rrna.err
#SBATCH -t 3-00:00:00

module load bioinfo-tools blast PDC
blastn -db ./BLASTDB/silva_rrna_all \
    -query ./filtered_for_rRNA_screen.fasta \
    -evalue 1e-25 -outfmt 7 -num_threads 16 -perc_identity 50 \
    -out filtered_vs_silva_rrna.blastn.tab