#!/bin/bash                                                                                             
                                                                                                        
# this will actually liberate all the dps machines... try ssh'ing into any after this :)                
                                                                                                        
chmod -R 700 ~/.ssh                                                                                     
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa                                                                
                                                                                                        
                                                                                                        
cat ~/.ssh/id_rsa.pub | ssh dps124 'cat >> .ssh/authorized_keys'                                        
                                                                                                        
echo "Done."
