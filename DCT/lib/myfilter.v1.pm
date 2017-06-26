package myfilter;
use strict; use warnings;

use Filter::Util::Call ;

sub import {
   my($type) = @_ ;
   filter_add(bless []) ;
}

sub filter {
   my($self) = @_ ;
   my($status) ;

   if (($status = filter_read()) > 0) {

      if (/\b(?<trans>FAILURE|ALWAYS)\(\s*(?<func_call>\w.*?)\(\s*(?<args>.*)\)\s*\)\s*\,\s*\z/) {
	 my $trans     = $+{trans};
	 my $func_call = $+{func_call};
	 my $args      = $+{args};
	 $args =~ s/\s*=>//g;
         my @args = split/ /,$args;
	 my $str  = join ',', map{ "\"".  $_ . "\""} @args;
	 $_ = "[ ('$trans', '$func_call', $str, ) ],\n";
      }
   }
   $status ;
}

1;
