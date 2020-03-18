# HotRec
### ISEM Repository for ANR project HotRec

1/ Create a writable Singularity container `Simul_LDhelmet.sif` as root from the existing Singularity Image File `Base_LDhelmet.sif`

`sudo singularity build --writable Simul_LDhelmet.sif LDhelmet_Singularity_Recipe.def`

2./ Mount the container as read-write using shell command with the --writable option for checking

`sudo singularity shell --writable -B /home/pagagnaire/TEST_RUN:/RUN Simul_LDhelmet.sif`

3./Prepare a local INPUT/OUTPUT folder `/path-to-that-directory/REPLICATE_RUN_i/` containing the recombination map file `genetic_map_large_scale_hotspot_i.txt` used for the MSprime simulations and the 12 empty output sub-folders where the results will be written:

`mkdir ne25m_ss10_bp5`
`mkdir ne25m_ss10_bp10`
`mkdir ne25m_ss10_bp50`
`mkdir ne25m_ss20_bp5`
`mkdir ne25m_ss20_bp10`
`mkdir ne25m_ss20_bp50`
`mkdir ne250m_ss10_bp5`
`mkdir ne250m_ss10_bp10`
`mkdir ne250m_ss10_bp50`
`mkdir ne250m_ss20_bp5`
`mkdir ne250m_ss20_bp10`
`mkdir ne250m_ss20_bp50`

4./ Execute the whole pipeline inside the container, using a binding of the local folder `/path-to-that-directory/REPLICATE_RUN_i/` with the `/RUN/` folder located at the root of the container.

`sudo singularity run --writable -B /home/pagagnaire/TEST_RUN:/RUN Simul_LDhelmet.sif /home/RUN_LD/run_ld_12_conditions.sh`
