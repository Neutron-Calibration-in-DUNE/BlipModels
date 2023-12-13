#!/bin/bash
#SBATCH -A dune                 # account to use for the job, '--account', '-A'
#SBATCH -J optimize_blip_graph_prep  # job name, '--job-name', '-J'
#SBATCH -C gpu                  # type of job (constraint can be 'cpu' or 'gpu'), '--constraint', '-C'
#SBATCH -q shared               # Jobs requiring 1 or 2 gpus should use the shared setting, all others use 'regular'
#SBATCH -t 24:00:00             # amount of time requested for the job, '--time', 't'
#SBATCH -N 1                    # number of nodes, '--nodes', '-N'
#SBATCH -n 1                    # number of tasks '--ntasks', -n'
#SBATCH -c 32                   # number of cores per task, '--cpus-per-task', '-c'
#SBATCH --gpus-per-task=1       # number of gpus to be used per task
#SBATCH --gpus-per-node=1       # number of gpus per node.
#SBATCH --gpu-bind=none         # comment this out if you don't want all gpus visible to each task

LOCAL_SCRATCH=/pscratch/sd/${USER:0:1}/${USER}
LOCAL_BLIP=/global/cfs/cdirs/dune/users/${USER}
LOCAL_DATA=/global/cfs/cdirs/dune/users/${USER}

setfacl -m u:nobody:x /global/cfs/cdirs/dune/users/${USER}
shifter --image=docker:infophysics/blip:latest \
        --volume="${LOCAL_SCRATCH}:/local_scratch;${LOCAL_BLIP}:/local_blip;${LOCAL_DATA}:/local_data" \
        ./perlmutter_optimize_blip_graph_prep.sh
