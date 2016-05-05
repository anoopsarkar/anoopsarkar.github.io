# paste.pl
# takes multiple files and produces each line of each file in columns

use strict;

my @fhtable = ();

my $i = 0;
for my $file (@ARGV) {
    my $fh;
    open($fh, $file) or die "could not open $file\n";
    $fhtable[$i++] = $fh;
}
my $sz = $i;
if ($sz >= 1) {
    my $fha = $fhtable[0];
    while ($a = <$fha>) {
	chomp($a);
	print "$a";
	for (my $i = 1; $i < $sz; $i++) {
	    my $fhb = $fhtable[$i];
	    $b = <$fhb>;
	    chomp($b);
	    print "\t$b"; 
	}
	print "\n";
    }
}
for (my $i = 0; $i < $sz; $i++) {
    my $fh = $fhtable[$i];
    close($fh);
}

# end of file

