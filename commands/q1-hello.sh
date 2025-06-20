#!/bin/bash

# Configs
source config.sh

# Hello
TASK="hello"
EXC="${GEM5_PATH}tests/test-progs/hello/bin/x86/linux/hello"
CMD="${GEM5_PATH}build/X86/gem5.opt ${GEM5_PATH}configs/example/se.py \
	-c ${EXC} \
	--cpu-type=TimingSimpleCPU --caches --l2cache \
	--mem-type=NVMainMemory --nvmain-config=${NVMAIN_PATH}Config/PCM_ISSCC_2012_4GB.config"

mkdir -p ${OUTPUTS_PATH}q1/${TASK}
(cd ${GEM5_PATH} && ${CMD} > ${OUTPUTS_PATH}q1/${TASK}/outputs 2> ${OUTPUTS_PATH}q1/${TASK}/errors)
echo "${CMD}" > ${OUTPUTS_PATH}q1/${TASK}/commands
cp ${GEM5_PATH}m5out/stats.txt ${OUTPUTS_PATH}q1/${TASK}/stats.txt
cp ${GEM5_PATH}m5out/config.ini ${OUTPUTS_PATH}q1/${TASK}/config.ini

