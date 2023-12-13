# Submit the preparation job and get its job ID
blip_graph_data_prep_jobid=$(sbatch blip_graph_data_prep.slurm | cut -d ' ' -f 4)

# Submit the array job with a dependency on the preparation job
sbatch --dependency=afterok:$blip_graph_data_prep_jobid blip_graph_optimize.slurm