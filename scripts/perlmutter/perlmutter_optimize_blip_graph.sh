#!/bin/bash
cd /local_scratch

prep_data_config="/local_blip/BlipModels/blip_graph/configs/prep_data.yaml"
optimization_config="/local_blip/BlipModels/blip_graph_configs/DEC/optimize_blip_graph_DEC_1.yaml"
optimization_script="/local_blip/BlipModels/scripts/perlmutter_blip_graph_test.slurm"
hyper_parameter_file="/local_scratch/hyper_parameter_data.csv"

# download data to /local_data/ and process it
blip "$prep_data_config"

# generate hyper-parameter configs
create_hyper_parameter_configs "$optimization_config"

# read in the hyper_parameter file
if [ ! -e "$hyper_parameter_file" ]; then
    echo "Error: Hyper parameter file '$hyper_parameter_file' not found!"
    exit 1
fi

while IFS=',' read -r hyper_parameter_config; do
    # check that line is not empty
    if [ -n "$hyper_parameter_config" ]; then
        sbatch --job-name="$hyper_parameter_config" "$optimization_script" "$hyper_parameter_config"
    fi
done < "$hyper_parameter_file"