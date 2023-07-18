#!/bin/sh
#SBATCH --job-name=blip_test
#SBATCH --partition=gpu_gce
#SBATCH --nodelist=wcgpu04
#SBATCH --gres=gpu:1 

SETUP_SCRIPT=/work1/davis_nc/Blip/scripts/wc_setup_blip.sh
CONFIG=/work1/davis_nc/BlipModels/protodune/config/production_pointnet_gammas_DR.yaml

source $SETUP_SCRIPT
blip $CONFIG
