#!/bin/bash

mkdir -p /home/ldhelmet/LDhelmet_v1.10/output &&
echo "Run find_confs"
bash /home/RUN_LD/ne250m_ss20_bp5/find_confs.bash   &&
echo "Run table_gen"
bash /home/RUN_LD/ne250m_ss20_bp5/table_gen.bash    &&
echo "Run pade"
bash /home/RUN_LD/ne250m_ss20_bp5/pade.bash         &&
echo "Run rjmcmc"
bash /home/RUN_LD/ne250m_ss20_bp5/rjmcmc.bash       &&
echo "Run post_to_text"
bash /home/RUN_LD/ne250m_ss20_bp5/post_to_text.bash 

