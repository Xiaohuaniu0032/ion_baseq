use strict;
use warnings;

my ($in) = @ARGV;
my $q_shift = 33;

my %base_q;
my $line = 0;
my $reads_num = 0;
open IN, "$in" or die;
while (<IN>){
	chomp;
	$line += 1;
	if ($line % 4 == 0){
		$reads_num += 1;
		my @q = split //, $_;
		for my $q (@q){
			my $q_asc = ord($q);
			my $base_q = $q_asc - $q_shift;
			$base_q{$base_q} += 1;
		}
	}
}
close IN;

print "reads_num: $reads_num\n";
print "base quality distribution:\n";

foreach my $q (sort {$a <=> $b} keys %base_q){
	my $n = $base_q{$q};
	print "$q\t$n\n";
}
