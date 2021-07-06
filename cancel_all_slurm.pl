use POSIX;
use strict;
my $line;

#Cancels all currently submitted slurm jobs...

`squeue -u b.bssc1d > very_temp_jobs.txt`;
open(IN, "<very_temp_jobs.txt");
while(!eof(IN)){
	$line = readline *IN;
	chomp $line;
	$line =~ s/^\s+//g;
	$line =~ s/ .*//g;
	print $line."\n";
	if ($line =~ m/^JOB/){
	}else{
		`scancel $line`;
	}
}
