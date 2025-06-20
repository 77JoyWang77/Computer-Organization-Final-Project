#!/bin/bash

# Configs
source config.sh

# Write-through cache
TASK="multiply-write-through"
EXC="${BENCHMARK_PATH}multiply"
CMD="${GEM5_PATH}build/X86/gem5.opt ${GEM5_PATH}configs/example/se.py \
    -c ${EXC} \
    --cpu-type=TimingSimpleCPU --caches --l2cache --l3cache \
    --l3_assoc=4 \
    --l1i_size=32kB --l1d_size=32kB --l2_size=128kB --l3_size=1MB \
    --mem-type=NVMainMemory --nvmain-config=${NVMAIN_PATH}Config/PCM_ISSCC_2012_4GB.config"

mkdir -p ${OUTPUTS_PATH}q5/${TASK}
(cd ${GEM5_PATH} && ${CMD} > ${OUTPUTS_PATH}q5/${TASK}/outputs 2> ${OUTPUTS_PATH}q5/${TASK}/errors)
echo "${CMD}" > ${OUTPUTS_PATH}q5/${TASK}/commands
cp ${GEM5_PATH}m5out/stats.txt ${OUTPUTS_PATH}q5/${TASK}/stats.txt
cp ${GEM5_PATH}m5out/config.ini ${OUTPUTS_PATH}q5/${TASK}/config.ini
