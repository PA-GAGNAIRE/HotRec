########################################################################
########################## PIPELINE LDHELMET ###########################
########################################################################

#!/bin/bash

for i in {1..10};
do 
	echo "Start run ${i}"
	echo "Run make_LDhelmet"
	bash make_LDhelmet.sh
	echo "Run anc_prior"
	Rscript anc_prior.R
	echo "Run run_all LDhelmet"
	bash /home/RUN_LD/ne250m_ss20_bp5/run_all.bash
	#Sélection de la première position des SNP (left SNP) et de la mean du taux de recombinaison du fichier output.txt sorti de LDhelmet
	grep -v '#' /home/ldhelmet/LDhelmet_v1.10/output/output.txt | grep -v 'ver' | cut -d ' ' -f 1,3 > /home/RUN_LD/ne250m_ss20_bp5/infer_rate.txt
	echo "Run plot_output"
	python plot_output.py
	echo "Run infer_ldhelmet"
	python infer_ldhelmet.py
	echo "Run rate_linear_model"
	Rscript rate_linear_model.R
	#Move file to run_i directory
	mkdir /RUN/ne250m_ss20_bp5/run_${i}
	mv /home/RUN_LD/ne250m_ss20_bp5/simul_large_scale_hotspot.png /RUN/ne250m_ss20_bp5/run_${i}/simul_large_scale_hotspot_${i}.png
	mv /home/RUN_LD/ne250m_ss20_bp5/Recombination_rate.txt /RUN/ne250m_ss20_bp5/run_${i}/Recombination_rate_${i}.txt
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot_int.vcf /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_int_${i}.vcf
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot.vcf /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_${i}.vcf
	mv /home/RUN_LD/ne250m_ss20_bp5/POS.txt /RUN/ne250m_ss20_bp5/run_${i}/POS_${i}.txt
	mv /home/RUN_LD/ne250m_ss20_bp5/REF.fa /RUN/ne250m_ss20_bp5/run_${i}/REF_${i}.fa
	mv /home/RUN_LD/ne250m_ss20_bp5/LDH_large_scale_hotspot.fa /RUN/ne250m_ss20_bp5/run_${i}/LDH_large_scale_hotspot_${i}.fa
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot.ldhelmet.pos /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_${i}.ldhelmet.pos
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot.ldhelmet.snps /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_${i}.ldhelmet.snps
	mv /home/RUN_LD/ne250m_ss20_bp5/anc_prior.txt /RUN/ne250m_ss20_bp5/run_${i}/anc_prior_${i}.txt
	mv /home/ldhelmet/LDhelmet_v1.10/output/output.conf /RUN/ne250m_ss20_bp5/run_${i}/output_${i}.conf
	mv /home/ldhelmet/LDhelmet_v1.10/output/output.lk /RUN/ne250m_ss20_bp5/run_${i}/output_${i}.lk
	mv /home/ldhelmet/LDhelmet_v1.10/output/output.pade /RUN/ne250m_ss20_bp5/run_${i}/output_${i}.pade
	mv /home/ldhelmet/LDhelmet_v1.10/output/output.post /RUN/ne250m_ss20_bp5/run_${i}/output_${i}.post
	mv /home/ldhelmet/LDhelmet_v1.10/output/output.txt /RUN/ne250m_ss20_bp5/run_${i}/output_${i}.txt
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot_bp5_1M.png /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_bp5_1M_${i}.png
	mv /home/RUN_LD/ne250m_ss20_bp5/All_recombination_rate.txt /RUN/ne250m_ss20_bp5/run_${i}/All_recombination_rate_${i}.txt
	mv /home/RUN_LD/ne250m_ss20_bp5/Rplots.pdf /RUN/ne250m_ss20_bp5/run_${i}/Rplots_${i}.pdf
	mv /home/RUN_LD/ne250m_ss20_bp5/large_scale_hotspot_recap_lm.csv /RUN/ne250m_ss20_bp5/run_${i}/large_scale_hotspot_recap_lm_${i}.csv
	echo "End run ${i}"
done


