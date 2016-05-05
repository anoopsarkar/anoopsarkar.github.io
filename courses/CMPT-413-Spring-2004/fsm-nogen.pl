
use strict;

my $usage = "$0 <file>\n";
my $allow_multichar_input = 1;

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
            my @items = generateNewStates($state, $index, @tape);
            for (my $i=0; $i <= $#items; $i+=2) {
                if (member($items[$i], $items[$i+1], @agenda) == 0) {
		    push(@agenda, ($items[$i], $items[$i+1]));
                }
            }
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

sub member {
    my ($state, $index, @list) = @_;
    for (my $i=0; $i <= $#list; $i+=2) {
        if (($list[$i] eq $state) and ($list[$i+1] eq $index)) {
	    return 1;
        }
    }
    return 0;
}

sub generateNewStates {
    my ($state, $index, @tape) = @_;
    # YOUR CODE HERE
}

1;

# end of file

