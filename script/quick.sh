#!/bin/bash

#./legacy_runII_v1_2016.sh &
#./legacy_runII_v1_2017.sh &
#./legacy_runII_v1_2018.sh &

#./legacy_runII_v2_2016.sh &
#./legacy_runII_v2_2017.sh &
#./legacy_runII_v2_2018.sh &

#./legacy_runII_v3_2016.sh 2>&1 | tee dir_log/log_2016_sh.txt &
#export condor_SCHEDD_HOST='bigbird10.cern.ch' && export condor_CREDD_HOST='bigbird10.cern.ch'
#./legacy_runII_v3_2017.sh 2>&1 | tee dir_log/log_2017_sh.txt  &
#export condor_SCHEDD_HOST='bigbird11.cern.ch' && export condor_CREDD_HOST='bigbird11.cern.ch'
#./legacy_runII_v3_2018.sh 2>&1 | tee dir_log/log_2018_sh.txt &

## update new signal microAODs
#dir_ori="/afs/cern.ch/work/y/ykao/tPrimeExcessHgg/CMSSW_10_6_8/src/flashgg/MetaData/data"
#dir_new="/afs/cern.ch/work/l/lata/public/ForPrafulla"
##dir_ori="/afs/cern.ch/work/y/ykao/tPrimeExcessHgg/CMSSW_10_6_8/src/flashgg/MetaData/data/backup"
##dir_new="/afs/cern.ch/work/y/ykao/tPrimeExcessHgg/CMSSW_10_6_8/src/flashgg/MetaData/data"
#era_2016="Era2016_RR-17Jul2018_v2"
#era_2017="Era2017_RR-31Mar2018_v2"
#era_2018="Era2018_RR-17Sep2018_v2"
#
#keyword="TprimeBToTH_Hgg"
#
##log="dir_log/log_check_json.txt"; date +%Y%m%d > ${log};
#log="dir_log/log_check_ori_json.txt"; date +%Y%m%d > ${log};
#
#for json in "datasets.json" "datasets_17.json" "datasets_6.json"
#do
#    era=${era_2016}
#    ori=${dir_ori}/${era}/${json}
#    new=${dir_new}/${era}/${json}
#    echo "2016" >> ${log}
#    grep ${keyword} ${ori} >> ${log}
#    echo "" >> ${log}
#done
#
#for json in "datasets.json"
#do
#    era=${era_2017}
#    ori=${dir_ori}/${era}/${json}
#    new=${dir_new}/${era}/${json}
#    echo "2017" >> ${log}
#    grep ${keyword} ${ori} >> ${log}
#    echo "" >> ${log}
#done
#
#for json in "datasets_19.json" "datasets_23.json" "datasets_24.json" "datasets_25.json"
#do
#    era=${era_2018}
#    ori=${dir_ori}/${era}/${json}
#    new=${dir_new}/${era}/${json}
#    echo "2018" >> ${log}
#    grep ${keyword} ${ori} >> ${log}
#    echo "" >> ${log}
#done

#cp legacy_runII_v3_2016.json legacy_runII_v3p2_2016.json
#cp legacy_runII_v3_2017.json legacy_runII_v3p2_2017.json
#cp legacy_runII_v3_2018.json legacy_runII_v3p2_2018.json
#
#vi legacy_runII_v3p2_2016.json
#vi legacy_runII_v3p2_2017.json
#vi legacy_runII_v3p2_2018.json
#
#vimdiff legacy_runII_v3_201?.sh


file="check_v3_ntuples.txt"
function extract()
{
    dir=$1
    echo "" >> $file
    echo $dir >> $file
    ls -lhrt $dir | grep root >> $file 
}

extract "signal_ntuples_v3p2_2016"
extract "ntuples_v3p1_2017"
extract "ntuples_v3p2_2017"
extract "ntuples_v3p2_2018"
