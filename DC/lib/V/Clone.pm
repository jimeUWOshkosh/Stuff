package V::Clone;
use strict; use warnings; use feature 'say'; use Moo;

has key => (
   is      => 'rw',
   default => undef,
);
sub gestate {
   say "\tgestate";
   return 1;
}
1;
