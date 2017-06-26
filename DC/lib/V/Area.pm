package V::Area;
use strict; use warnings; use feature 'say'; use Moo;

has key => (
   is      => 'rw',
   default => undef,
);
sub is_in {
   say "\tis_in";
   return 1;
}
1;
