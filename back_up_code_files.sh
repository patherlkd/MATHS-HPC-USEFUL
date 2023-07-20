#!/bin/bash                                                                                                                                                 
                                                                                                                                                            
project=$1                                                                                                                                                  
                                                                                                                                                            
echo "Backing up project ${project}..."                                                                                                                     
                                                                                                                                                            
datestring=$(date +"date-%Y-%m-%d")                                                                                                                         
                                                                                                                                                            
find ./$project -name "*.pl" -o -name "*.py"  -o -name "*.sh"  -o -name "*.cpp"  -o -name "*.hpp"  -o -name "*.c" -o -name "*.h" -o -name "*generic*" -o -n\
ame "in.*" | tar -cvjf ${project}_backup_${datestring}.tar.bzip2 -T -                                                                                       
                                                                                                                                                            
echo "Done." 
