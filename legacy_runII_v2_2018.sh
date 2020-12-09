outdir="signal_ntuples_v2_2018"

fggRunJobs.py --load legacy_runII_v2_2018.json \
              -d $outdir \
              -n 500 \
              -q workday \
              --no-use-tarball --no-copy-proxy \
              -x cmsRun workspaceStd.py maxEvents=-1 \
                                        doSystematics=False \
                                        dumpWorkspace=False \
                                        dumpTrees=True \
                                        processId=tHq
