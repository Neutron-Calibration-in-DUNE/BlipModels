#!/bin/bash
# script for running a set of blip_graph optimizations on
# NERSC gpus.

# generate the singles
# python generate_blip_singles.py

cd /local_data/

# generate the data sets
arrakis /workspace/BlipModels/blip_graph/configs/prep_data.yaml

# run the DEC1 optimization
blip /workspace/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_1.yaml
# run the DEC2 optimization
blip /workspace/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_2.yaml
# run the DEC3 optimization
blip /workspace/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_3.yaml
# run the DEC4 optimization
blip /workspace/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_4.yaml
# run the DEC5 optimization
blip /workspace/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_5.yaml
