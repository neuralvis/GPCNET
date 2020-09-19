#!/bin/bash --login

###
# job name
#SBATCH --job-name=gpc_network_test
# job stdout file
#SBATCH --output=gpc_network_test.%J.out
# job stderr file
#SBATCH --error=gpc_network_test.%J.err
# On failure, requeue for another try
#SBATCH --requeue
# maximum job time in HH:MM:SS
#SBATCH --time=06:00:00
#SBATCH --nodes=10
# maximum memory
#SBATCH --mem-per-cpu=1024
# run a single task
#SBATCH --ntasks=2560
#SBATCH --cpus-per-task=1
###

module restore PrgEnv-cray

# module load cce/10.0.3
# module load craype/2.7.2
# module load cray-mpich/8.0.15
# module load cray-libsci/20.08.1.2

cd /lus/cls01053/msrinivasa/develop/GPCNET/

srun network_test
