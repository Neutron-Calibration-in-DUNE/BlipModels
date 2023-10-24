#!/bin/bash
LOCAL_SCRATCH=/pnfs/dune/scratch/users/${USER}
LOCAL_BLIP=/wclustre/davis_nc/${USER}/blip
LOCAL_DATA=/wclustre/davis_nc/${USER}/data

module load apptainer
apptainer shell --nv --home=${LOCAL_BLIP} /wclustre/davis_nc/images/blip.sif