
while ($line = <>) {
    chomp($line);
    @words = split(/\s+/, $line);
    for $word (@words) { 
	if (defined $count{$word}) {
	    $count{$word}++;
	} else {
	    $count{$word} = 1;
	}
    }
}

for $key (keys %count) {
    print "key=$key count=$count{$key}\n";
}

