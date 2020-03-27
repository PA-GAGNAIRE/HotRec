#!/bin/bash
## The script builds a directory for runnning the LDhelmet simulation pipeline ##

replicate_run="$1" # the first arg is an interger for run i
rec_landscape="$2" # the second arg is the name of the input recombination landscape file used for run i

echo "Generating folder for Replicate Run : $replicate_run"

mkdir Replicate_Run_$replicate_run

cd ./Replicate_Run_$replicate_run
	mkdir REPLICATE_RUN_$replicate_run
	mkdir TMP_OUT

	git clone https://github.com/PA-GAGNAIRE/HotRec.git
	mv ./HotRec/RUN_LD ./
	rm -r -f ./HotRec/

	cp ../$2 ./

cd ./REPLICATE_RUN_$replicate_run
	mkdir ne25m_ss10_bp5 ne25m_ss10_bp10 ne25m_ss10_bp50 ne25m_ss20_bp5 ne25m_ss20_bp10 ne25m_ss20_bp50 ne250m_ss10_bp5 ne250m_ss10_bp10 ne250m_ss10_bp50 ne250m_ss20_bp5 ne250m_ss20_bp10 ne250m_ss20_bp50
	cp ../$2 ./
	mv $2 genetic_map_large_scale_hotspot.txt

echo "DONE"
