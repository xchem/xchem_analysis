#!/bin/bash
# This script will submit 81 jobs with each combination of i and j
# Can be used with more elaborate bash magic
for i in 1 2 3 4 5 6 7 8 9
  do
    for j in 1 2 3 4 5 6 7 8 9
      do
        qsub ./my_script.sh $i $j
      done
  done