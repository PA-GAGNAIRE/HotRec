# HotRec

### ISEM Repository for ANR project HotRec

1/Prepare a local INPUT/OUTPUT folder `/path-to-that-directory/REPLICATE_RUN_i/` containing the recombination map file `genetic_map_large_scale_hotspot.txt` used for the MSprime simulations and the 12 empty output sub-folders where the results will be written:

`mkdir REPLICATE_RUN_i`
`cd REPLICATE_RUN_i`
`mkdir ne25m_ss10_bp5 ne25m_ss10_bp10 ne25m_ss10_bp50 ne25m_ss20_bp5 ne25m_ss20_bp10 ne25m_ss20_bp50 ne250m_ss10_bp5 ne250m_ss10_bp10 ne250m_ss10_bp50 ne250m_ss20_bp5 ne250m_ss20_bp10 ne250m_ss20_bp50`

2./ Execute the whole pipeline inside the container, using a binding of the local folder `/path-to-that-directory/REPLICATE_RUN_i/` with the `/RUN/` folder located at the root of the container.

`sudo singularity run --writable -B /home/pagagnaire/TEST_RUN:/RUN Simul_LDhelmet.sif /home/RUN_LD/run_ld_12_conditions.sh`
