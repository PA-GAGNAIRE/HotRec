#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
/home/ldhelmet/LDhelmet_v1.10/ldhelmet find_confs --num_threads 8 -w 50 -o /home/ldhelmet/LDhelmet_v1.10/output/output.conf /home/RUN_LD/ne25m_ss10_bp50/LDH_large_scale_hotspot.fa
