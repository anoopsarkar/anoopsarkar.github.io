
my $usage = "test-regexp regular-expression-file test-file\n";
my $refile = shift or die $usage;
my $testfile = shift or die $usage;

open(R, $refile) or die $usage;
my $re = <R>;
chomp($re);
print "regexp = ", $re, "\n";
close(R);

open(T, $testfile) or die $usage;
while (<T>) {
  chomp;
  if (/$re/) { print "y $_\n"; }
  else { print "n $_\n"; }
}
close(T);
