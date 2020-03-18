#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
time /home/ldhelmet/LDhelmet_v1.10/ldhelmet table_gen --num_threads 20 -t 0.001 -r 0.0 0.1 10.0 1.0 100.0 -c /home/ldhelmet/LDhelmet_v1.10/output/output.conf -o /home/ldhelmet/LDhelmet_v1.10/output/output.lk 
