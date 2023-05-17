#!/bin/sh
#SBATCH --job-name=blip_test
#SBATCH --partition=gpu_pce
#SBATCH --nodelist=wcgpu04
#SBATCH --gres=gpu:4 

SETUP_SCRIPT = /work1/davis_nc/Blip/scripts/wc_setup.sh
BLIP_ENV = /wclustre/dune/ncarrara/blip
PY_SCRIPT = /work1/davis_nc/BlipModels/protodune/protodune.py
CONFIG = /work1/davis_nc/BlipModels/protodune/config/unet_test.yaml

source $SETUP_SCRIPT
conda activate $BLIP_ENV
python $PY_SCRIPT $CONFIG
