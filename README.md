# HotRec

### ISEM Repository for ANR project HotRec


#### LDhelmet simulation pipeline

1/ Build a local INPUT/OUTPUT directory using `build_run_dir.sh` for writting the output of the LDhelmet simulation pipeline.
The first arg is an interger for *replicate run i* and the second arg is the name of the input recombination landscape file used for *run i*.


*Example for the simulated recombination landscape replicate 4 in map file `genetic_map_large_scale_hotspot_4.txt` :*

`bash build_run_dir.sh 4 genetic_map_large_scale_hotspot_4.txt`

The sript prepares a directory named `Replicate_Run_4` with 3 subfolders:

`/RUN_LD/` Contains the scripts necessary for each of the 12 tested conditions. Used as temporary, can be deleted when finished.


`/TMP_OUT/` Used as temporary forlder for LDhelmet outputs, can be deleted when finished.


`/REPLICATE_RUN_4/` The OUTPUT folder with 12 sub-folders corresponding to the 12 tested conditions, each containing 10 replicate runs of simulations with MSprime and LDhelmet analysis.


2./ Execute the whole pipeline inside the container, using a binding of each of the 3 local subfolders `/REPLICATE_RUN_i/`, `/TMP_OUT/` and `/RUN_LD/` with folders located within the container.

`cd ./Replicate_Run_4`


`singularity run -B /local-path-to/REPLICATE_RUN_4:/RUN -B /local-path-to/RUN_LD:/home/RUN_LD -B /local-path-to/TMP_OUT:/home/ldhelmet/LDhelmet_v1.10/output /local-path-to/Simul_LDhelmet.sif /home/RUN_LD/run_ld_12_conditions.sh`


3./ Execute the whole pipeline inside the container on the MBB cluster using the `qsub_LDhelmet.sh` placed in the run directory `Replicate_Run_4`:

`cd ./Replicate_Run_4`


`qsub_LDhelmet.sh`
