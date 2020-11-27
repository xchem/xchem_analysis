#!/bin/bash
# My Script that contains the commands I want to run
# Arguments I want to give to qsub:
# Essentially requires 1Gb of RAM and expects to run for 1 minute h_cpu=h:m:s
#$ -cwd
#$ -j y
#$ -N MySGEJob
#$ -M tyler@diamond.ac.uk
#$ -m be
#$ -o ~/MySGEJob.out
#$ -l h_cpu=0:1:0,mem_free=1G
source activate myenv
python example_python.py -x $1 -y $2

# R example just in-case ;)
module load R
Rscript example_R.R $1 $2