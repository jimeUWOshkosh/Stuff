use strict; use warnings;
package PurchaseClones;
use feature 'say';
use Moo;


require "AssetSteps.pl";
require "Steps.pl";


has key => (
   is      => 'rw',
   default => undef,
);

sub attempt {
   return 1;
}

sub new_exchange {
   my ($slug,        $slugtxt, 
       $successmsg,  $successmsgtxt,
       $failuresmsg, $failuresmsgtxt) = @_;
  return PurchaseClones->new;
}

sub price {
   say "price";
   return 1;
}

sub station_area {
   say "station_area";
   return 1;
}

use myfilter;
sub purchase_clone {
   say 'purchase_clone';
   my ($self) = @_;
   my $character = "and Irvine";
   my $bet_amount = 1_000_006;
   my $exchange = PurchaseClones::new_exchange(
      slug            => 'purchase-clone',
      success_message => 'You have purchased a new clone',
      failure_message => 'You could not purchase a new clone',
      Steps(
                  Location( $self      => is_in_area   => 'clonevat'              ),
                  Wallet(   $self      => pay          => $self->price('cloning') ),
                  Clone(    $self      => gestate      => $self->station_area     ),
         FAILURE( Wallet(   $character => remove       => $bet_amount ) ),
         ALWAYS( Wallet( $character => show_balance ) ),
      ),
   );
   return $exchange->attempt;
}
1;
