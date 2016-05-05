
use strict;

sub chunkProperNouns(@) {
    my (@line) = @_;
    my $output = join(" ", map { (/NNPS?$/) ? $_ : "\n" } @line);
    $output =~ s/\s?(\n )+/\n/g;
    $output =~ s/^\s+//;
    $output =~ s/\s+$//;
    return split("\n", $output);   
}
 
my @sentence1 = ("Show/VB", "me/PRP", "the/DT", "flights/NNS", "from/IN",
	     "San/NNP", "Diego/NNP", "to/TO", "Toronto/NNP"); 
my @sentence2 = ("From/IN", "Washington/NNP", "D/NNP", "C/NNP", "to/TO",
	     "Philadelphia/NNP", "on/IN", "Wednesdays/NNPS"); 

my @output1 = chunkProperNouns(@sentence1);
my @output2 = chunkProperNouns(@sentence2);

my @test1 = ("San/NNP Diego/NNP", "Toronto/NNP");
my @test2 = ("Washington/NNP D/NNP C/NNP", "Philadelphia/NNP", "Wednesdays/NNPS");

if ("@test1" eq "@output1") { print "yes: @output1\n"; }
else { print "no\n"; }

if ("@test2" eq "@output2") { print "yes: @output2\n"; }
else { print "no\n"; }

# while (my $line = <>) {
#   my @proper_nouns = chunkProperNouns(split(" ", $line));
#   my $output = join("\n", @proper_nouns);
#   print "$output\n" if ($output);
# }
