
# simple example of a class definition and inheritance in Perl

# for more on classes in Perl view the man pages for perlobj: 
# "man perlobj"

# Also see the man pages: perlbot (Bag of Tricks), 
# perlboot (Beginner's OO Tutorial), 
# perltoot (Tom's OO Tutorial, Part I), perltooc (Part II)

package Foo;

sub new {
    my $type = shift;
    my %params = @_;
    my $self = {};
    $self->{'High'} = $params{'High'};
    $self->{'Low'} = $params{'Low'};
    bless $self, $type;
    return $self;
}

sub printall {
    my $type = shift;
    print "In Foo: High=$type->{'High'}\n";
    print "In Foo: Low=$type->{'Low'}\n";
}

1;

# end of package Foo

package Bar;
@ISA = qw(Foo);

sub printall {
    my $type = shift;
    print "In Bar: High=$type->{'High'}\n";
    print "In Bar: Low=$type->{'Low'}\n";
}

# end of package Bar

package main;

$a = Foo->new( 'High' => 42, 'Low' => 11 );
print "High=$a->{'High'}\n";
print "Low=$a->{'Low'}\n";


$b = Foo->new( 'High' => 12, 'Low' => 1 );
print "High=$b->{'High'}\n";
print "Low=$b->{'Low'}\n";

print "\n\n";

$a->printall();
$b->printall();

print "\n\n";

$c = Bar->new( 'High' => 12, 'Low' => 1 );
$c->printall();

