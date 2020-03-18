# HotRec
### ISEM Repository for ANR project HotRec

1/ *To create a writable Singularity container as root from the existing Singularity Image File `./Base_LDhelmet.sif`*

`sudo singularity build --writable Base_LDhelmet.sif LDhelmet_Singularity_Recipe.def`

2./ *To mount the container as read-write using shell command with the --writable option*

`sudo singularity shell --writable -B /home/pagagnaire/TEST_RUN:/RUN Base_LDhelmet_EXT1.sif`

