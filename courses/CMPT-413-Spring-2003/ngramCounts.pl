# ngramCounts.pl
# finds counts for each ngram in the input

use strict;

my $line;
my %count = ();
my %seen = ();
my $total = 0;

while ($line = <>) {
    $total++;
    chomp($line);
    $seen{$line} = 'true';
    while ($line ne '') {
	$count{$line}++;
	$line =~ s/[^\s]+\s*$//;
	$line =~ s/\s+$//;
    }
}

for my $key (sort { $count{$b} <=> $count{$a} } keys %seen) {
    my $orig = $key;
    my @output = ();
    while ($key ne '') {
	push(@output, $count{$key});
	$key =~ s/[^\s]+\s*$//;
	$key =~ s/\s+$//;
    }
    push(@output, $total);
    push(@output, "__EOC__");
    push(@output, $orig);
    print "@output\n";
}

# end of file

