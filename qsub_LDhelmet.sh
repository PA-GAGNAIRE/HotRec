#$ -S /bin/bash
#$ -N Singularity_Job_REP2
#$ -q cemeb.q
#$ -l h_rt=10:00:00
#$ -cwd
#$ -V
module load singularity/3.1
singularity run -B ./REPLICATE_RUN_4:/RUN -B ./RUN_LD:/home/RUN_LD -B ./TMP_OUT:/home/ldhelmet/LDhelmet_v1.10/output ../Simul_LDhelmet.sif /home/RUN_LD/run_ld_12_conditions.sh
