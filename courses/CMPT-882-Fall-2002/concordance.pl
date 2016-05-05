#!/usr/bin/perl
# concordance: provides keyword in context (one per line)
# Anoop Sarkar <anoop at cs.sfu.ca>

$leftlen = 40;
$rightlen = 40;
$pad = 4;
$usage = "$0 <word> <corpus> <context>\n";
$word = shift or die $usage;
$corpus = shift or die $usage;
$context = shift;
$leftlen = $rightlen = $context if (defined $context);
if ($corpus eq '-') { *F = *STDIN; }
else { open (F, $corpus) or die $usage; }
while (<F>) {
  chomp;
  $len = length($_);
  $offset = 0;
  $concmatchindex = index($_, $word, $offset);
  while ($concmatchindex != -1) {
     $matchlen = length($word);
     $leftpad = $concmatchindex - $leftlen;
     $leftstart = max(0,$leftpad);
     $rightstart = min($len,$concmatchindex + $matchlen);
     if ($leftpad < 0) {
        print (' ' x -$leftpad, substr($_, $leftstart, $leftlen+$leftpad));
     } else {
        print substr($_, $leftstart, $leftlen);
     }
     print (' ' x $pad, substr($_, $concmatchindex, $matchlen), ' ' x $pad);
     print substr($_, $rightstart, $rightlen), "\n";
     $offset = $concmatchindex +1;
     $concmatchindex = index($_, $word, $offset);
  }
}
close(F);

sub min {
  my($x,$y) = @_;
  return ($x < $y) ? $x : $y;
}

sub max {
  my($x,$y) = @_;
  return ($x > $y) ? $x : $y;
}

1;
