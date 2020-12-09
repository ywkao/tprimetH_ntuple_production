#!/bin/bash

#./legacy_runII_v2_2016.sh &
#./legacy_runII_v2_2017.sh &
#./legacy_runII_v2_2018.sh &

# update new signal microAODs
dir_ori="/afs/cern.ch/work/y/ykao/tPrimeExcessHgg/CMSSW_10_6_8/src/flashgg/MetaData/data"
dir_new="/afs/cern.ch/work/l/lata/public/ForPrafulla"

era_2016="Era2016_RR-17Jul2018_v2"
era_2017="Era2017_RR-31Mar2018_v2"
era_2018="Era2018_RR-17Sep2018_v2"

keyword="TprimeBToTH_Hgg"

mkdir -p "dir_log"
log="dir_log/log_check_json.txt"; date +%Y%m%d > ${log};

for json in "datasets.json" "datasets_17.json" "datasets_6.json"
do
    era=${era_2016}
    ori=${dir_ori}/${era}/${json}
    new=${dir_new}/${era}/${json}
    echo "2016" >> ${log}
    grep ${keyword} ${new} | grep -v "name" >> ${log}
    echo "" >> ${log}
done

for json in "datasets.json"
do
    era=${era_2017}
    ori=${dir_ori}/${era}/${json}
    new=${dir_new}/${era}/${json}
    echo "2017" >> ${log}
    grep ${keyword} ${new} | grep -v "name" >> ${log}
    echo "" >> ${log}
done

for json in "datasets_19.json" "datasets_23.json" "datasets_24.json" "datasets_25.json"
do
    era=${era_2018}
    ori=${dir_ori}/${era}/${json}
    new=${dir_new}/${era}/${json}
    echo "2018" >> ${log}
    grep ${keyword} ${new} | grep -v "name" >> ${log}
    echo "" >> ${log}
done
