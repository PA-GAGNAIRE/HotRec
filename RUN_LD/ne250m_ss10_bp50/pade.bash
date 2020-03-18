#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
time /home/ldhelmet/LDhelmet_v1.10/ldhelmet pade --num_threads 8 -t 0.01 -x 11 --defect_threshold 40 -c /home/ldhelmet/LDhelmet_v1.10/output/output.conf -o /home/ldhelmet/LDhelmet_v1.10/output/output.pade
