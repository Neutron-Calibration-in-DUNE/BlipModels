# conda_init
# conda activate blip
# export LD_LIBRARY_PATH=/home/laura/UTILS/anaconda3/envs/blip/lib:$LD_LIBRARY_PATH

cd ../../Blip
pip install .
cd ../BlipModels/gammas_mergetry
blip config/gamma_analysis.yaml