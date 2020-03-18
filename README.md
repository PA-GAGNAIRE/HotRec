# HotRec
### ISEM Repository for ANR project HotRec

1/ Create a writable Singularity container `Simul_LDhelmet.sif` as root from the existing Singularity Image File `Base_LDhelmet.sif`

`sudo singularity build --writable Simul_LDhelmet.sif LDhelmet_Singularity_Recipe.def`

2./ Mount the container as read-write using shell command with the --writable option for checking

`sudo singularity shell --writable -B /home/pagagnaire/TEST_RUN:/RUN Simul_LDhelmet.sif`

3./ Execute the pipeline within the container

`sudo singularity run --writable -B /home/pagagnaire/TEST_RUN:/RUN Simul_LDhelmet.sif /home/RUN_LD/run_ld_12_conditions.sh`
