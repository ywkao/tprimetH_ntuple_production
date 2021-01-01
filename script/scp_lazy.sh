#!/bin/bash
file=$1
echo "scp -p ${file} ykao@ntugrid5.phys.ntu.edu.tw:/wk_cms/ykao/work/CMSSW_10_6_8/rootfiles/"
scp -p ${file} ykao@ntugrid5.phys.ntu.edu.tw:/wk_cms/ykao/work/CMSSW_10_6_8/rootfiles/
