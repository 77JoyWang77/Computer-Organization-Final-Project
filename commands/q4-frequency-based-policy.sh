#!/bin/bash

# Configs
source config.sh

# RRIP replacement policy
TASK="q4-frequency-based-policy"
EXC="${BENCHMARK_PATH}quicksort"
CMD="${GEM5_PATH}build/X86/gem5.opt ${GEM5_PATH}configs/example/se.py \
    -c ${EXC} \
    --cpu-type=TimingSimpleCPU --caches --l2cache --l3cache \
    --l3_rp=FBRP --l3_assoc=2 \
    --l1i_size=32kB --l1d_size=32kB --l2_size=128kB --l3_size=1MB \
    --mem-type=NVMainMemory --nvmain-config=${NVMAIN_PATH}Config/PCM_ISSCC_2012_4GB.config"

mkdir -p ${OUTPUTS_PATH}${TASK}
(cd ${GEM5_PATH} && ${CMD} > ${OUTPUTS_PATH}${TASK}/outputs 2> ${OUTPUTS_PATH}${TASK}/errors)
echo "${CMD}" > ${OUTPUTS_PATH}${TASK}/commands
cp ${GEM5_PATH}m5out/stats.txt ${OUTPUTS_PATH}${TASK}/stats.txt
cp ${GEM5_PATH}m5out/config.ini ${OUTPUTS_PATH}${TASK}/config.ini
