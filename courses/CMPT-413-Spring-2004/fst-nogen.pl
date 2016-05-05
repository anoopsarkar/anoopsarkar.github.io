
use strict;

my $usage = "$0 <file>\n";

($#ARGV >= 0) or die $usage;
my $fstFile = $ARGV[0];
our ($startstate, @finalstate, @edges, @input, @output);
require $fstFile;

my $inpline = <STDIN>;
my $outline = <STDIN>;
$inpline =~ s/\s*$//;
$outline =~ s/\s*$//;
print "input=$inpline output=$outline\n";
my @inpTape = split('', $inpline);
my @outTape = split('', $outline);
if (fstRecognize(\@inpTape, \@outTape)) {
    print "yes\n";
} else {
    print "no\n";
}

sub fstRecognize  {
    my ($inpTapeRef, $outTapeRef) = @_;
    
    my @agenda = ( $startstate, -1, -1 );
    while (1) {
        my $state = shift(@agenda);
        my $inpIndex = shift(@agenda);
        my $outIndex = shift(@agenda);
        if (acceptState($state, $inpIndex, $outIndex, $#$inpTapeRef, $#$outTapeRef)) {
            return 1;
        } else {
	    my @newItems = 
		generateNewStates($state, $inpIndex, $outIndex, $inpTapeRef, $outTapeRef);
            push(@agenda, @newItems); 
	    if ($#agenda == -1) {  return 0; }
        }
    }
}

sub acceptState {
    my ($state, $inpIndex, $outIndex, $endInp, $endOut) = @_;
    if (($finalstate[$state] eq 'true') and ($inpIndex==$endInp) and ($outIndex==$endOut)) {
	return 1;
    }
    return 0;
}

sub generateNewStates {
    my ($state, $inpIndex, $outIndex, $inpTapeRef, $outTapeRef) = @_;

    my @inpTape = @$inpTapeRef; 
    my @outTape = @$outTapeRef;

    # YOUR CODE HERE
}

1;

# end of file

