#!/bin/bash 

# 載入路徑設定（相對於 commands/）
source config.sh

# 編譯 GEM5 + NVMain
(cd ${GEM5_PATH} && scons EXTRAS=${NVMAIN_PATH} ${GEM5_PATH}build/X86/gem5.opt -j 4)

