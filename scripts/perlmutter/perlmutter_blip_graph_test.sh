#!/bin/bash
cd /workspace

# download data to /local_data/ and process it
blip BlipModels/blip_graph/config/prep_data.yaml

# run the optimize_blip_graph_DEC_1.yaml file
blip BlipModels/blip_graph/config/DEC/optimize_blip_graph_DEC_1.yaml
