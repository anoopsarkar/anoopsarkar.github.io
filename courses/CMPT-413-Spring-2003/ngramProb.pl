# ngramProb.pl
# takes output of ngramCounts and produces probabilities

my $line;
while ($line = <>) {
    chomp($line);
    my @fields = split(/\s+/, $line);
    my $sz = $#fields + 1;
    my @output = ();
    my $i;
    for ($i = 0; $i < $sz; $i++) {
	last if ($fields[$i+1] eq "__EOC__");
	push(@output, $fields[$i]/$fields[$i+1]);
    }
    push(@output, @fields[$i+1..$#fields]);
    print "@output\n";
}

