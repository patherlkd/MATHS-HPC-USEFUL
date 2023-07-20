#!/bin/bash                                                                                                                                                 
#SBATCH --job-name=WIPING-LOCAL-DATA      # Job name                                                                                                        
#SBATCH --time=01-00:00:00 # wall time                                                                                                                      
##SBATCH --mail-type=BEGIN,END,FAIL     # Mail events (NONE, BEGIN, END, FAIL, ALL)                                                                         
##SBATCH --mail-user=EMAIL                                                                                                                                  
##SBATCH --nodelist=NODELIST                                                                                                                                
##==SBATCH -N NNODES                                                                                                                                        
#SBATCH --ntasks-per-node 1                                                                                                                                 
#SBATCH -c 1 # Multithreading                                                                                                                               
                                                                                                                                                            
##module load mpi/openmpi-x86_64                                                                                                                            
                                                                                                                                                            
echo "STARTING SLURM JOB"                                                                                                                                   
                                                                                                                                                            
start=$(date +%s)                                                                                                                                           
                                                                                                                                                            
rm -rf /local/ldavis/LOCALDIRTOWIPE                                                                                                                         
                                                                                                                                                            
end=$(date +%s)                                                                                                                                             
                                                                                                                                                            
echo "ENDED SLURM JOB"                                                                                                                                      
                                                                                                                                                            
elapsedtimesecs=$(($end-$start))                                                                                                                            
                                                                                                                                                            
echo $elapsedtimesecs 
