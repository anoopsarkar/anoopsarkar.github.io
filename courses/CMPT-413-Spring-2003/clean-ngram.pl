
# clean-ngram.pl

use strict;

# removes spurious <stop> <start> ngrams 

while (<>) {
    next if /<stop>\s+<start>/;
    print;
}


