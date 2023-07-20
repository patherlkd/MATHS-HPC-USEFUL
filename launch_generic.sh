#!/bin/bash                                                                                                                                                 
#SBATCH --job-name=<NAME>      # Job name                                                                                                                   
#SBATCH --time=<DD>-<HH>:<MM>:<SS> # wall time                                                                                                              
#SBATCH --ntasks-per-node <NTASKS>                                                                                                                          
#SBATCH --cpus-per-task <CPUTASK> # Multithreading                                                                                                          
                                                                                                                                                            
##module load mpi/openmpi-x86_64                                                                                                                            
<MODULELOADS>                                                                                                                                               
                                                                                                                                                            
echo "STARTING SLURM JOB"                                                                                                                                   
                                                                                                                                                            
start=$(date +%s)                                                                                                                                           
                                                                                                                                                            
<RUN>                                                                                                                                                       
                                                                                                                                                            
end=$(date +%s)                                                                                                                                             
                                                                                                                                                            
echo "ENDED SLURM JOB"                                                                                                                                      
                                                                                                                                                            
elapsedtimesecs=$(($end-$start))                                                                                                                            
                                                                                                                                                            
echo $elapsedtimesecs    
