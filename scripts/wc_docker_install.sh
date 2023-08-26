#!/bin/bash
module load apptainer
export APPTAINER_CACHEDIR=/wclustre/davis_nc/apptainer/.apptainer/cache
apptainer build /wclustre/davis_nc/images/blip.sif docker://infophysics/blip:latest