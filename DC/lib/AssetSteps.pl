use strict; use warnings;
use V::Area;
use V::Clone;
use V::Location;
use V::Wallet;

sub Area {
   print "Area\n";
   my ($character, $method, $text) = @_;
   V::Area->new( subject => $character )->$method($text);
}
sub Clone {
   print "Clone\n";
   my ($character, $method, $text) = @_;
   V::Clone->new( subject => $character )->$method($text);
}
sub Location {
   print "Location\n";
   my ($character, $method, $text) = @_;
   V::Location->new( subject => $character )->$method($text);
}
sub Wallet {
   print "Wallet\n";
   my ($character, $method, $text) = @_;
   V::Wallet->new( subject => $character )->$method($text);
}
1;
