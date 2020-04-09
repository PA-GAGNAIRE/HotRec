#!/bin/bash

#$ -S /bin/bash
#$ -N build_run_dir
#$ -q cemeb.q
#$ -l h_rt=00:33:00
#$ -o my_job.out -j y
#$ -cwd

bash build_run_dir.sh 8 genetic_map_large_scale_hotspot_8.txt
