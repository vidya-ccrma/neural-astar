# Run experiments on CSM dataset
# Author: Ryo Yonetani
# Affiliation: OMRON SINIC X
# 
# usage:
# $ sh 2_CSM.sh | sh (if you want to run experiments sequentially)

logdir=icml2021_csm

echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m VanillaAstar -gb \"train.num_epochs = 1\" \"VanillaAstar.g_ratio = 0.5\" \"VanillaAstarPlanner.output_exp_instead_of_rel_exp = True\" 
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m VanillaAstar -gb \"train.num_epochs = 1\" \"VanillaAstar.g_ratio = 0.2\" 
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m VanillaAstar -gb \"train.num_epochs = 1\" \"VanillaAstar.g_ratio = 0.0\" 
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m SAILGPU -gb \"SAILGPU.beta0 = 0.0\" \"train.num_epochs = 400\" \"train.batch_size = 100\"
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m SAILGPU -gb \"SAILGPU.beta0 = 1.0\" \"train.num_epochs = 400\" \"train.batch_size = 100\"
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m BBAstar -gb \"NeuralAstar.g_ratio = 0.5\" \"BBAstar.bbastar_lambda = 20.0\" \"train.num_epochs = 400\"
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m NeuralAstar -gb \"NeuralAstar.g_ratio = 0.0\" \"train.num_epochs = 400\"  \"Runner.multi_gpu = True\"
echo python train.py -gf config/*.gin -d data/street/mixed_064_moore_c16.npz -w ${logdir} -m NeuralAstar -gb \"NeuralAstar.g_ratio = 0.5\" \"train.num_epochs = 400\"  \"Runner.multi_gpu = True\"