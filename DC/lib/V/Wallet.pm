package V::Wallet;
use strict; use warnings; use feature 'say'; use Moo;

has key => (
   is      => 'rw',
   default => undef,
);
sub pay {
   say "\tpay";
   return 1;
}
sub show_balance {
   say "\twhat balance";
}
sub remove {
}
1;
