use strict;

my $replacecost = 2;
my $insertcost  = 1;
my $deletecost  = 1;

($#ARGV >= 1) or die "$0 target source\n";
my @target = split('', shift);
my @source = split('', shift);

minEditDistance(\@target, \@source);

#my @memo = minEditDistance(\@target, \@source);
#printAlignment(\@memo, \@target, \@source);

sub minEditDistance($$) {
    my ($target, $source) = @_;
    my @target = @{$target};
    my @source = @{$source};

    my $n = @target;
    my $m = @source;

    my @dist = ();

    $dist[0][0] = 0;
    for (my $i = 1; $i <= $n; $i++) { 
	$dist[$i][0] = $dist[$i-1][0] + $insertcost;
    }
    for (my $j = 1; $j <= $m; $j++) { 
	$dist[0][$j] = $dist[0][$j-1] + $deletecost;
    }

    for (my $j = 1; $j <= $m; $j++) {
	for (my $i = 1; $i <= $n; $i++) {
	    my $inscost = $insertcost + $dist[$i-1][$j];
	    my $delcost = $deletecost + $dist[$i][$j-1];
	    my $add = ($source[$j-1] ne $target[$i-1]) ? $replacecost : 0;
	    my $substcost = $add + $dist[$i-1][$j-1];

	    my $min = $substcost;
	    if ($inscost < $min) {
		$min = $inscost;
	    } elsif ($delcost < $min) {
		$min = $delcost;
	    }
	    $dist[$i][$j] = $min;
	}
    }
    print "levenshtein distance = $dist[$n][$m]\n";
}

1;
