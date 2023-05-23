#!/bin/bash
#
# Example data staging job script that copies a directory from Eddie to DataStore with rsync
# 
# Job will restart from where it left off if it runs out of time 
# (so setting an accurate hard runtime limit is less important)

# Grid Engine options start with a #$
#$ -N stageoutFRS
#$ -cwd
# Choose the staging environment
#$ -q staging
#$ -M S2268606@ed.ac.uk    #contact info
#$ -m beas 

# Hard runtime limit
#$ -l h_rt=12:00:00 

# Make the job resubmit itself if it runs out of time: rsync will start where it left off
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm

# Source and destination directories
#
# Source path on Eddie. It should be on the fast Eddie HPC filesystem, starting with one of:
# /exports/csce/eddie, /exports/chss/eddie, /exports/cmvm/eddie, /exports/igmm/eddie or /exports/eddie/scratch, 
#
SOURCE=/exports/eddie/scratch/s2268606/Project_23
#
# Destination path on DataStore in the staging environment
# Note: these paths are only available on the staging nodes
# It should start with one of /exports/csce/datastore, /exports/chss/datastore, /exports/cmvm/datastore or /exports/igmm/datastore
#
DESTINATION=/exports/cmvm/eddie/eb/groups/mabbott_grp/Fraser/

# Perform copy with rsync
# Note: do not use -p or -a (implies -p) as this can break file ACLs at the destination
rsync -rl ${SOURCE} ${DESTINATION}
