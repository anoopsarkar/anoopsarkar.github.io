
use strict;

my $usage = "$0 <file>\n";

($#ARGV >= 0) or die $usage;
my $fstFile = $ARGV[0];
our ($startstate, @finalstate, @edges, @input, @output);
require $fstFile;

my $inputline = <STDIN>;
$inputline =~ s/\s*$//;
my @tape = split('', $inputline);
if (NDRecognize(@tape)) {
    print "yes\n";
} else {
    print "no\n";
}

sub NDRecognize  {
    my (@tape) = @_;

    my $endtape = $#tape;
    my @agenda = ( $startstate, -1 );
    my $state = shift(@agenda);
    my $index = shift(@agenda);

    while (1) {
	print("currentItem=$state, index=$index tape=", 
	      join('',@tape[$index+1..$endtape]), "\n");

	if (acceptState($state, $index, $endtape)) {
	    print "accept state=$state\n";
	    return 1;
	} else {
	    print "agenda=", join(' ', @agenda), "\n";
	    push(@agenda, generateNewStates($state, $index, @tape));
	    if ($#agenda == -1) {  # agenda is empty
		return 0;
	    }
	    $state = shift(@agenda);
	    $index = shift(@agenda);
	}
    }
}

sub acceptState {
    my ($state, $index, $endtape) = @_;
    if (($finalstate[$state] eq 'true') and ($index == $endtape)) {
	return 1;
    }
    return 0;
}

1;

