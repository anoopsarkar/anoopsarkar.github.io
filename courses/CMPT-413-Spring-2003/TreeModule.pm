
package TreeModule;

use strict;

sub addRoot($$) {
    my ($tree, $new) = @_;
    $tree->[0] = $new;
}

sub addChild($$) {
    my ($tree, $new) = @_;
    push(@{$tree}, @$new);
}

sub getChildren($) {
    my ($tree) = @_;
    my @nodes = @{$tree};
    shift(@nodes);
    return @nodes;
}

sub stringToTree($) {
    my ($s) = @_;
    $s =~ s/\(/\[/g;
    $s =~ s/\)/\]/g;
    $s =~ s/ /,/g;
    $s =~ s/([^,\[\]]+)/'$1'/g;
    my $tree = eval $s;
    return $tree;
}

sub treeToString($) {
  my ($tree) = @_;
  my $s = "";
  my @nodes = @{$tree};
  $s = "(" . shift(@nodes);
  for my $kid (@nodes) { 
      $s .= " " . treeToString($kid); 
  }
  $s .= ")";
}

sub treemap($$) {
  my ($tree, $func) = @_;
  my @nodes = @{$tree};
  my @newNodes = ();
  if ($#nodes >= 0) {
      push(@newNodes, &{$func}($nodes[0]));
      for my $kid (@nodes[1..$#nodes]) { 
	  push(@newNodes, treemap($kid, $func)); 
      }
  }
  return \@newNodes;
}

1;

