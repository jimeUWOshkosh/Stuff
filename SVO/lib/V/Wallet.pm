package V::Wallet;
use strict; use warnings; use feature 'say'; use Moo;

has key => (
   is      => 'rw',
   default => undef,
);
sub pay {
   return 1;
}
1;
