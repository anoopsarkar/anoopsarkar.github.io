# File: invert.pl

# Scans a file of words (one word per line) and prints out those words
# that are palindromes (with the -p option), e.g. malayalam; or prints
# out words that when viewed upside-down are also words (with the -u
# option), e.g. NOON (upside-down NOON) or HO (upside-down OH). The -u
# option is the default.

$arg1 = shift or die "$0 [-p|-u] <words>\n";
$arg2 = shift;
if (defined $arg2) { 
    $dict = $arg2; 
    $palindrome = ($arg1 eq '-p') ? 1 : 0; 
} else { 
    $dict = $arg1; 
    $palindrome = 0;
}

%invert = ('H' => 1, 'I' => 1, 'N' => 1, 'O' => 1, 'S' => 1, 'X' => 1, 'Z' => 1);

if ($dict =~ /\.bz2$/) { $filename = "bzip2 -dc $dict |"; }
elsif ($dict =~ /\.gz$/) { $filename = "gzip -dc $dict |"; }
else { $filename = $dict; }
open(D, $filename) or die "cannot open $dict";
while (<D>)
{
    chomp;
    next if (/^.$/); # skip single letter words
    $dict{uc($_)} = 1; # convert word to uppercase and store in dict hash
}
close(D);

foreach (keys %dict)
{
    $rev = join('', reverse (split ('', $_)));
    if ($palindrome) {
	print "$_\t\t$rev\n" if ($_ eq $rev);
    } else {
	$upsidedown = 0;
	foreach (split ('', $_)) {
	    if (!defined $invert{$_}) {
		$upsidedown = 0;
		last;
	    } else {
		$upsidedown = 1;
	    }
	}
	print "$_\t\t$rev\n" if (($upsidedown) and defined($dict{$rev})); 
    }
}
