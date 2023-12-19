#!/bin/bash
cd /local_scratch

prep_data_config="/local_blip/BlipModels/blip_graph/configs/prep_data.yaml"
optimization_config="/local_blip/BlipModels/blip_graph/configs/DEC/optimize_blip_graph_DEC_1.yaml"

# download data to /local_data/ and process it
blip "$prep_data_config"

# generate hyper-parameter configs
create_hyper_parameter_configs "$optimization_config" -hyper_parameter_location='${LOCAL_BLIP}'