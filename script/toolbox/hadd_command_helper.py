#/usr/bin/env python2
import os

def make_command(samples, output):
    good_histos = []
    for hist in samples:
      size = os.stat(hist).st_size * (1./(1024))
      if size >= 1.:
        good_histos.append(hist)
        #print("good hist: %s, size (kb): %d" % (hist, os.stat(hist).st_size * (1./(1024))))
      else:
        print("bad  hist: %s, size (kb): %d" % (hist, os.stat(hist).st_size * (1./(1024))))
    
    target = ""
    for hist in good_histos:
      target += "%s " % hist

    command = '/usr/bin/ionice -c2 -n7 hadd -f -k -j 4 %s %s' % (output, target)
    return command

def produce_commands(samples, output_dir):
    commands = []
    copy = samples
    counter = 1 
    while len(copy) > 20:
        output = output_dir + "/" + "merged_ntuple_" + str(counter) + ".root"
        command = make_command(copy[:20], output)
        commands.append(command)
        copy = copy[20:]
        counter += 1

    output = output_dir + "/" + "merged_ntuple_" + str(counter) + ".root"
    command = make_command(copy, output)
    commands.append(command)
    return commands
