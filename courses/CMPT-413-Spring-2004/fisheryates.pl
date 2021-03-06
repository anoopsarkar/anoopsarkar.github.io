
use strict;

sub fisher_yates_shuffle {
    my ($array) = @_;
    for (my $i = @$array; --$i; ) {
        my $j = int(rand($i+1));
        next if ($i == $j);
        @$array[$i,$j] = @$array[$j,$i];  
        # note that: @$array[$j,$i] equals ($array[$j],$array[$i])
    }
}

1;

