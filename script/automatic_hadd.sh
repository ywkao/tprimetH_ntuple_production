#!/bin/bash
if [[ $# -eq 0 ]];
then
    echo "Please give a number to denote sub-version. (e.g. 4 => v1.4)"
    exit 0
fi
subversion=$1
version="v2.${subversion}"
ver_str="v2p${subversion}"
dir="ntuples_${version}"
dir_16="signal_ntuples_v2_2016"
dir_17="signal_ntuples_v2_2017"
dir_18="signal_ntuples_v2_2018"

mkdir -p ${dir}

#subversion=$1
#version="v1.${subversion}"
#ver_str="v1p${subversion}"
#dir="ntuples_${version}"
#dir_16="signal_ntuples_2016"
#dir_17="signal_ntuples_2017"
#dir_18="signal_ntuples_2018"
#
# automatic hadd
#mkdir -p ${dir}
#echo "mv ${dir_16} ${dir_17} ${dir_18} ${dir}"; mv ${dir_16} ${dir_17} ${dir_18} ${dir};
#time hadd ${dir}/TprimeBToTH_M-700_LH_TuneCUETP8M1_13TeV_Era2016_${ver_str}.root ${dir}/${dir_16}/*root
#time hadd ${dir}/TprimeBToTH_M-700_LH_TuneCP5_13TeV_Era2017_${ver_str}.root ${dir}/${dir_17}/*root
#time hadd ${dir}/TprimeBToTH_M-700_LH_TuneCP5_PSweights_13TeV_Era2018_${ver_str}.root ${dir}/${dir_18}/*root
#echo "ls ./${dir}"; ls ./${dir};

function combine()
{
    year=$1
    mass=$2
    file=${dir}/TprimeBToTH_M-${mass}_Era${year}_${ver_str}.root

    if [[ $year == "2016" ]]; then dir_=${dir_16}; fi
    if [[ $year == "2017" ]]; then dir_=${dir_17}; fi
    if [[ $year == "2018" ]]; then dir_=${dir_18}; fi
    
    time hadd ${file} ${dir}/${dir_}/*${mass}*root 2>&1 | tee dir_log/log_check_20201211.txt
}

echo "cp -rp ${dir_16} ${dir_17} ${dir_18} ${dir}"; cp -rp ${dir_16} ${dir_17} ${dir_18} ${dir};

# legacy_runII_v2_2016.json
combine "2016" "600"
combine "2016" "625"
combine "2016" "650"
combine "2016" "675"
combine "2016" "700"
combine "2016" "800"
combine "2016" "900"
combine "2016" "1000"
combine "2016" "1100"
combine "2016" "1200"
# legacy_runII_v2_2017.json
combine "2017" "600"
combine "2017" "625"
combine "2017" "650"
combine "2017" "675"
combine "2017" "700"
combine "2017" "800"
combine "2017" "900"
combine "2017" "1000"
combine "2017" "1100"
combine "2017" "1200"
# legacy_runII_v2_2018.json
combine "2018" "600"
combine "2018" "625"
combine "2018" "650"
combine "2018" "675"
combine "2018" "700"
combine "2018" "800"
combine "2018" "900"
combine "2018" "1000"
combine "2018" "1100"
combine "2018" "1200"

# make tarball and scp
#file=${dir}.tar.gz
#echo "tar -zcvf ${file} ${dir}/*root"; tar -zcvf ${file} ${dir}/*root; ls ${file};
#scp -p ${file} ykao@ntugrid5.phys.ntu.edu.tw:/wk_cms/ykao/work/CMSSW_10_6_8/rootfiles/

new_target="../tprimetH/rootfiles/${dir}"
mkdir -p ${new_target}
mv ${dir}/*root ${new_target}
echo ${new_target}
ls ${new_target}


#legacy_runII_v2_2016.json
#        "tprime_tHq_1000" : [
#        "tprime_tHq_600" : [
#        "tprime_tHq_800" : [
#        "tprime_tHq_900" : [
#legacy_runII_v2_2017.json
#        "tprime_tHq_1000" : [
#        "tprime_tHq_1100" : [
#        "tprime_tHq_1200" : [
#        "tprime_tHq_600" : [
#        "tprime_tHq_625" : [
#        "tprime_tHq_650" : [
#        "tprime_tHq_675" : [
#        "tprime_tHq_700" : [
#        "tprime_tHq_800" : [
#        "tprime_tHq_900" : [
#legacy_runII_v2_2018.json
#        "tprime_tHq_625" : [
#        "tprime_tHq_650" : [
#        "tprime_tHq_700" : [
#        "tprime_tHq_900" : [
