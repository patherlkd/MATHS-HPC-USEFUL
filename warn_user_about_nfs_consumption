#!/bin/perl                                                                                                                                                 
                                                                                                                                                            
use v5.10;                                                                                                                                                  
                                                                                                                                                            
my $username = `echo \$USER`;                                                                                                                               
chomp($username);                                                                                                                                           
my $pref_suffix = 'G';                                                                                                                                      
my $limit_in_suffix_units = 150;                                                                                                                            
                                                                                                                                                            
my %size_suffixes = ( 'K' => 0,                                                                                                                             
                      'M' => 1,                                                                                                                             
                      'G' => 2 );                                                                                                                           
                                                                                                                                                            
my $du_out = `du -sh /clusternfs/${username}/`;                                                                                                             
chomp($du_out);                                                                                                                                             
my ($nfs_hsize,$dir) = split(/\s+/,$du_out);                                                                                                                
                                                                                                                                                            
# simplest case suffixes matching                                                                                                                           
if ($nfs_hsize =~ /${pref_suffix}/){                                                                                                                        
    $nfs_hsize =~ s/${pref_suffix}//g;                                                                                                                      
                                                                                                                                                            
    if ($nfs_hsize >= $limit_in_suffix_units){                                                                                                              
        say " === NFS CONSUMPTION WARNING === ";                                                                                                            
        say " User ${username}: your /clusternfs/${username}/ is ${nfs_hsize}${pref_suffix} and is therefore over ${limit_in_suffix_units}${pref_suffix}."; 
        say " Please consider cleaning up your files.";                                                                                                     
        say " === NFS CONSUMPTION WARNING === ";                                                                                                            
    }                                                                                                                                                       
                                                                                                                                                            
    exit;                                                                                                                                                   
}                                                                                                                                                           
                                                                                                                                                            
                                                                                                                                                            
$actual_suffix = chop($nfs_hsize);                                                                                                                          
                                                                                                                                                            
# Case where suffix is more than pref_suffix (i.e. 1 KB < 1 MB < 1 GB etc).                                                                                 
                                                                                                                                                            
if($size_suffixes{$actual_suffix} > $size_suffixes{$pref_suffx}) {                                                                                          
                                                                                                                                                            
    say " === NFS CONSUMPTION WARNING === ";                                                                                                                
    say " User ${username}: your /clusternfs/${username}/ is over ${limit_in_suffix_units}${pref_suffix}.";                                                 
    say " Please consider cleaning up your files.";                                                                                                         
    say " === NFS CONSUMPTION WARNING === ";                                                                                                                
}    
