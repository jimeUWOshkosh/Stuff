package V::Location;
use strict; use warnings; use feature 'say'; use Moo;

has key => (
   is      => 'rw',
   default => undef,
);
sub is_in_area {
   say "\tis_in_area";
   return 1;
}
1;
