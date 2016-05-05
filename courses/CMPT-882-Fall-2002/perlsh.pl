#!/usr/bin/perl

$lcount = 0; $rcount = 0;
while (<>) {
  chomp;
  $lcount += (tr/\{//) ;
  $rcount += (tr/\}//) ;
  $partialexpr .= $_ ; 
  if (($lcount - $rcount) == 0) {
      $lcount = 0; $rcount = 0; 
      $expr = $partialexpr . ';'; 
      $partialexpr = "" ;
      print "perlsh ==>  ";
      eval $expr;
      if ($@) { print $@; }
  }
} 

