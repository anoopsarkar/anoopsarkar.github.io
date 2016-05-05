# skip.pl
# skips required number of words and prints one word per line

use strict;

my $usage = "$0 <skip> <file>\n";
die $usage if ($#ARGV < 1);
my $skip = shift;
my $file = shift;
my $fh;
undef $/;
open($fh, $file) or die "file error: $usage";
my $file = <$fh>;
close($fh);
$file =~ s/\s+$//g;
$file =~ s/\n/ /g;
$file =~ s/\s+/ /g;
my $i = 0;
while ($i < $skip) {
    $file =~ s/^[^\s]+//;
    $file =~ s/^\s+//;
    $file =~ s/$/ EOT/;
    $i++;
}
$file =~ s/ /\n/g;
$file =~ s/$/\n/g;
print $file;

# end of file

