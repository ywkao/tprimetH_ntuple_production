#!/usr/bin/env python2
import os
import subprocess
import glob
import toolbox.parallel_utils
import toolbox.hadd_command_helper

dirs = [ "ntuples_v3p2_2016", "ntuples_v3p1_2017", "ntuples_v3p2_2017", "ntuples_v3p2_2018" ]

commands = []
for directory in dirs:
    # prepare output directory
    year = directory.split("_")[-1]
    version = directory.split("_")[1][:2]
    new_dir = "merged_ntuples/" + "merged_ntuples_" + version + "_" + year

    # prepare sample lists
    os.chdir( "ntuples_stashed/" + directory )
    ntuples = glob.glob("*root")
    os.chdir("../../")

    # look for unique sample name
    samples = []
    for ntuple in ntuples:
        sample_name = ntuple.split("_USER_")[0]
        samples.append(sample_name)

    samples_uniq = list(set(samples))
    for sample in samples_uniq:
        stem = sample.split("-RunII")[0]
        era = sample.split("-RunII")[1].split("-")[0]
        sample_name = new_dir + "/" + stem + "-RunII" + era
        output_dir = sample_name.replace("output", "merged_ntuple")
        subprocess.call("mkdir -p %s" % output_dir, shell=True)

        # find all the existing root files
        related_ntuples = glob.glob( "ntuples_stashed/%s/%s*" % (directory, sample) )

        tokens = toolbox.hadd_command_helper.produce_commands(related_ntuples, output_dir)
        for command in tokens:
            commands.append(command)

    break

nPar = 12
toolbox.parallel_utils.submit_jobs(commands, nPar)
