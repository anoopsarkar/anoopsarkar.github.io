
package FeatureStruct;

use strict;

sub parseText {
    my ($text) = @_;
    my $dag = {};

    # remove spaces around the = 
    $text =~ s/\s*=\s*/=/g;

    # convert each line of text of the feature structure into a string
    # that contains the perl data structure for the dag equivalent

    for my $line (split("\n", $text)) {
	next if ($line =~ /^\s*$/);

	my ($lhs, $rhs) = split('=', $line);
	my $lhseval = "\$dag" . parseFeaturePath($lhs);
	my $rhseval = '';

	if ($rhs =~ /^\s*<[^>]*>\s*$/) {
	    $rhseval = "\$dag" . parseFeaturePath($rhs);
	    $lhseval .= "->{'pointer'}";
	} else {
	    $rhseval = "'$rhs'";
	    $lhseval .= "->{'content'}";
	}

	my $rhsResult = undef;
	eval "\$rhsResult=$rhseval";

	if (!defined $rhsResult) {
	    print STDERR "Warning: $rhseval has no value\n";
	} 

	# after creating the string, eval it to produce corresponding
	# dag representation of the feature structure

	#print "$lhseval=$rhseval\n";
	eval "$lhseval=$rhseval";
    }

    return $dag;
}

sub parseFeaturePath {
    my ($text) = @_;
    $text =~ s/^</->{\'content\'}->\{\'/;
    $text =~ s/>$/\'\}/;
    $text =~ s/ /\'\}->{\'content\'}->\{\'/g;
    return $text;
}

sub stringValue {
    my ($dag) = @_;
    my @strings = recursiveStringValue($dag);
    for my $str (@strings) {
	$str =~ s/^/</;
	$str =~ s/ =/>=/;
    }
    return (join("\n", @strings) . "\n");
}

sub recursiveStringValue {
    my ($dag) = @_;
    if (defined $dag->{'pointer'}) {
	return recursiveStringValue($dag->{'pointer'});
    } elsif ((defined $dag->{'content'}) and (! ref $dag->{'content'})) {
	return ("=" . $dag->{'content'});
    } elsif ((defined $dag->{'content'}) and (ref $dag->{'content'})) {
	my @values = ();
	for my $key (keys %{$dag->{'content'}}) {
	    my @tmp = recursiveStringValue($dag->{'content'}->{$key});
	    map { $_ = "$key " . $_ } @tmp;
	    push(@values, @tmp);
	}
	return @values;
    } else {
	print STDERR "Error: strange feature structure: $dag\n";
	return ();
    }
}

sub realContents {
    my ($dag) = @_;
    return ((defined $dag->{'pointer'}) ? realContents($dag->{'pointer'}) : 
	    ((defined $dag->{'content'}) ? $dag->{'content'} : ''));
}

sub unify {
    my ($dagX, $dagY) = @_;
    my $dag = {};

    my $realX = realContents($dagX);
    my $realY = realContents($dagY);

    return $dag;
}

1;
