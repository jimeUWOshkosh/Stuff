package myfilter;

use Filter::Util::Call ;

sub import {
   my($type) = @_ ;
   filter_add(bless []) ;
}

sub filter {
   my($self) = @_ ;
   my($status) ;

   if (($status = filter_read()) > 0) {

      if (/\b(?<pgm>FAILURE|ALWAYS)\(\s*(?<func_call>\w.*)\(\s*(?<args>.*)\)\s*\)\s*\,\s*\z/) {
	 my $pgm       = $+{pgm};
	 my $func_call = $+{func_call};
	 my $args      = $+{args};
	 $args =~ s/\s*=>//g;
         my @args = split/ /,$args;
	 my $str  = join ',', map{ "\"".  $_ . "\""} @args;
	 #$_ = "[ ('$pgm', '$func_call', $str ]\n";
	 $_ = "[ ('$pgm', '$func_call', $str, ) ],\n";

      }
      
      #      if (s/\b(?<pgm>FAILURE|ALWAYS)\(\s*(?<func_call>\w.*)\(\s*(?<args>.*)\)\s*\)\s*\,\s*\z/[('$+{pgm}', '$+{func_call}', "$+{args}")],\n/) {
      #	 s/=>//g;
      #}
   }
   $status ;
}

1 ;
