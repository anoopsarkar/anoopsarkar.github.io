
package ppTBL;

use strict;

sub readCorpus {
    my ($filename) = @_;

    my $mesg = "could not find $filename\n";
    die $mesg if (! -f $filename);

    my $fh;
    if ($filename =~ /\.gz$/) {
	open($fh, "gzip -dc $filename |") or die $mesg;
    } else {
	open($fh, $filename) or die $mesg;
    }

    my @corpus = ();

    while (<$fh>) {
	chomp;
	my ($num, $v, $n1, $p, $n2, $attachment) = split;
	(defined $attachment) or die "data error\n";
	push(@corpus, "$v $n1 $p $n2 $attachment");
    }

    close($fh);
    return \@corpus;
}

# findAllRuleConditions: uses the function generateFromTemplates to
# find all the possible rule conditions in the training data

sub findAllRuleConditions {
    my ($training) = @_;

    my $sz = $#$training+1;
    my $numRules = 0;
    my @rules = ();
    my %ruleMemorize = ();
    my @rulesApplicable = ();

    for (my $i = 0; $i < $sz; $i++) {
	my ($v, $n1, $p, $n2, $attachment) = split(' ', $training->[$i]);
	for my $ruleCondition (generateFromTemplates($v, $n1, $p, $n2)) {

	    # check if this rule has been seen before

	    my $ruleIndex = $ruleMemorize{$ruleCondition};

	    # if not, assign a ruleIndex to the new rule and memorize

	    if (! defined $ruleIndex) {
		$ruleIndex = $numRules++;
		$rules[$ruleIndex] = $ruleCondition;
		$ruleMemorize{$ruleCondition} = $ruleIndex;
	    }

	    # remember the index of each example in the training data
	    # where the rule condition was applicable -- this will be
	    # useful later when checking the error of each rule over
	    # the training data, since only the examples where the
	    # rule could possibly apply need to be checked rather than
	    # the entire training data

	    push (@{$rulesApplicable[$ruleIndex]}, $i);
	}
    }

    return (\@rules, \@rulesApplicable);
}

# generateFromTemplates: for a particular example in the training data
# return a list of possible rule conditions as regexp matches, e.g. a
# rule condition that matches a particular preposition, say "in", is
# represented as "[^\s]+ [^\s]+ in [^\s]+"

sub generateFromTemplates {
    my ($v, $n1, $p, $n2) = @_;
    my $any = '[^\s]+';
    return ("$v $n1 $p $n2",
	    "$v $n1 $p $any",
	    "$v $any $p $n2",
	    "$any $n1 $p $n2",
	    "$v $any $p $any",
	    "$any $n1 $p $any",
	    "$any $any $p $n2",
	    "$any $any $p $any");
}

sub readListOfRules {
    my ($filename) = @_;
    my @rules = ();
    my $fh;
    open($fh, $filename) or die "could not find $filename\n";
    while (my $rule = <$fh>) {
	chomp;
	my @myrule = split(' ', $rule);
	my $ruleIndex = $myrule[0];
	my $pattern = "@myrule[1..4]";
	my $from = $myrule[5];
	my $to = $myrule[6];
	push(@rules, [$ruleIndex, $pattern, $from, $to]); 
    }
    close($fh);
    return \@rules;
}

sub applyListOfRules {
    my ($corpus, $rules, $maxRulesAllowed) = @_;

    my $guess = applyDefaultRule($corpus, 'N');
    my $sz = $#$corpus+1;
    for (my $i = 0; $i < $sz; $i++) {

	my @corpusItem = split(' ', $corpus->[$i]);
	my $match = "@corpusItem[0..3]";
	my $ruleCount = 0;

	for my $rule (@$rules) {

	    last if ($ruleCount++ >= $maxRulesAllowed);

	    my $ruleIndex = $rule->[0];
	    my $pattern = $rule->[1]; 
	    my $from = $rule->[2];
	    my $to = $rule->[3];

	    #print STDERR "trying to match: $pattern with $match\n";
	    if (($guess->[$i] eq $from) and 
		($match =~ /^$pattern$/)) {
		#print STDERR "matched: $pattern with $match\n";
		$guess->[$i] = $to;
	    }
	}
    }

    return $guess;
}

sub applyDefaultRule {
    my ($training, $default) = @_;
    my $sz = $#$training+1;
    my $defaultString = $default x $sz;
    my @default = split('', $defaultString);
    return \@default;
}

sub evaluate {
    my ($gold, $corpus) = @_;
    my $total = $#$corpus+1;
    my $numCorrect = 0;
    for (my $i = 0; $i < $total; $i++) {
	my ($v, $n1, $p, $n2, $correct) = split(' ', $gold->[$i]);
	my $guess = $corpus->[$i];
	++$numCorrect if ($correct eq $guess);
    }
    return ($numCorrect/$total);
}

1;
