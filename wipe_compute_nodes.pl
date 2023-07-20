#!/bin/perl                                                                                                                                                                                
                                                                                                                                                                                           
use v5.10;                                                                                                                                                                                 
                                                                                                                                                                                           
use Capture::Tiny ':all'; # to check output of system command                                                                                                                              
                                                                                                                                                                                           
$here = "/clusternfs/ldavis/";                                                                                                                                                             
                                                                                                                                                                                           
my $nodeprefix = 'hpc';                                                                                                                                                                    
my @nodeindices = (1..16);                                                                                                                                                                 
#my @nodeindices = qw( 4 13 );                                                                                                                                                             
my @dirs = qw{ example_dir };                                                                                                                                                              
                                                                                                                                                                                           
foreach $nodeindex (@nodeindices){                                                                                                                                                         
    foreach $dir (@dirs){                                                                                                                                                                  
                                                                                                                                                                                           
        $skip = 0;                                                                                                                                                                         
                                                                                                                                                                                           
        $nodename = ${nodeprefix}.${nodeindex};                                                                                                                                            
                                                                                                                                                                                           
        ($stdout, $stderr, $exit) = capture {                                                                                                                                              
                                                                                                                                                                                           
            system("squeue | grep $nodename | sort -k8");                                                                                                                                  
                                                                                                                                                                                           
        };                                                                                                                                                                                 
                                                                                                                                                                                           
                                                                                                                                                                                           
                                                                                                                                                                                           
        my @stdoutlines= split("\n",$stdout);                                                                                                                                              
        if ($stdoutlines[0] =~ m/R/){                                                                                                                                                      
            $skip =1;                                                                                                                                                                      
            say "Skipping wipe of $nodename as jobs are running there..";                                                                                                                  
        }                                                                                                                                                                                  
                                                                                                                                                                                           
                                                                                                                                                                                           
        if (!$skip){                                                                                                                                                                       
            $genericlaunchfile = "${here}/launch_wipe_compute_nodes.sh";                                                                                                                   
            $launchfile = "${here}/launch_wipe_${dir}_on_${nodename}.sh";                                                                                                                  
                                                                                                                                                                                           
            open($in,'<',$genericlaunchfile) or die;                                                                                                                                       
            open($out,'>',$launchfile) or die;                                                                                                                                             
                                                                                                                                                                                           
            while(my $line = <$in>){                                                                                                                                                       
                                                                                                                                                                                           
                $line =~ s/LOCALDIRTOWIPE/${dir}/;                                                                                                                                         
                print $out $line;                                                                                                                                                          
                                                                                                                                                                                           
            }                                                                                                                                                                              
            close($out);                                                                                                                                                                   
            close($in);                                                                                                                                                                    
            $runme = "sbatch -w ${nodename} ${launchfile}";                                                                                                                                
#           say $runme;                                                                                                                                                                    
            system($runme);                                                                                                                                                                
        }                                                                                                                                                                                  
                                                                                                                                                                                           
    }                                                                                                                                                                                      
}   
