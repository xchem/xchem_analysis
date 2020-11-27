#!/bin/bash
# This will submit 1000 jobs in batches of 50, This is the preferred method of doing jobs if you ever have to submit thousands of jobs at once.
#$ -cwd
#$ -j y
#$ -N MySGEJob
#$ -M tyler@diamond.ac.uk
#$ -m be
#$ -o ~/MySGEJob.out
#$ -t 1-1000
#$ -tc 50
source activate myenv
# Although this only works on whatever $SGE_TASK_ID is, you can use this variable as a row index to read specific information
# from a table to configure mutliple arguments at once...
python example_python.py $SGE_TASK_ID