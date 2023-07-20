#!/bin/bash

node1=$1
node2=$2

for node in $(eval echo "{$node1..$node2}")
do
    echo $node
    eval "nodename="hpc${node}""
    sbatch -w $nodename launch_dummy_job.sh
done
