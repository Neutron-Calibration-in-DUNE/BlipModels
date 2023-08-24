#!/bin/sh
#SBATCH --job-name=blip_test
#SBATCH --partition=gpu_gce
#SBATCH --nodelist=wcgpu04
#SBATCH --gres=gpu:1 

module load apptainer
HOME=/wclustre/davis_nc/ apptainer shell --nv --home=/wclustre/davis_nc/ /wclustre/davis_nc/images/blip.sif
BLIP_CONFIG=/work1/davis_nc/Blip/config/blank_config.yaml

blip $BLIP_CONFIG
