
# clean-tagged.pl

# takes Penn Treebank part of speech tagged data in the original
# format and converts it into two output files: one file with the part
# of speech tag sequences for each sentence written to $file.tags and
# the other file with the word associated with each part of speech tag
# in each sentence written to $file.emit

$file = shift or die "$0 <file>\n";

# first set the delimiter for <> to be the delimiter used in the raw
# Treebank data
$/ = "======================================";   

# open the output files
open($tags, ">$file.tags") or die "could not open $file.tags\n";
open($emit, ">$file.emit") or die "could not open $file.emit\n";

# open the input file
open($fh, $file) or die "no file: $file\n";

while (<$fh>) { # remember that this reads in everything upto $/
    chomp;

    # clean up newlines
    s/\n/ /g;

    # remove the phrase markers
    s/\s*\[\s*/ /g;
    s/\s*\]\s*/ /g;

    s/\s+/ /g;
    s/^\s*//;
    next if /^\s*$/;

    # remove the section markers if they exist
    next if /^@/;

    # add start and stop symbols
    s|^|<start>/<start> |;
    # remove the sentence final period to make WSJ more like ATIS
    s| ./.\s*$||;
    s|$| <stop>/<stop>|;

    # remove the separator between tag and word, remember that the
    # forward slash can be a literal if preceded by a backslash
    s|([^\\])/|$1 |g;

    # finally we can separate the input into tags and emit streams
    my @line = split(' ', $_);
    my @tags = ();
    my @emit = ();
    for (my $i = 0; $i < $#line; $i+=2) {
	push(@tags, $line[$i+1]);
	push(@emit, "$line[$i+1] $line[$i]");
    }
    print $tags join(' ', @tags), "\n";
    print $emit join("\n", @emit), "\n";
}
close($fh);
print STDERR "finished writing $file.tags\n";
close($tags);
print STDERR "finished writing $file.emit\n";
close($emit);

1;

# end of file
