#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
time /home/ldhelmet/LDhelmet_v1.10/ldhelmet rjmcmc --num_threads 8 -l /home/ldhelmet/LDhelmet_v1.10/output/output.lk -p /home/ldhelmet/LDhelmet_v1.10/output/output.pade --snps_file /home/RUN_LD/ne25m_ss10_bp50/large_scale_hotspot.ldhelmet.snps --pos_file /home/RUN_LD/ne25m_ss10_bp50/large_scale_hotspot.ldhelmet.pos -a /home/RUN_LD/ne25m_ss10_bp50/anc_prior.txt -b 50 --burn_in 100000 -n 1000000 -o /home/ldhelmet/LDhelmet_v1.10/output/output.post
