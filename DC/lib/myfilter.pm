package myfilter;
use strict; use warnings;

use Filter::Util::Call;

sub import {
  my ($self,)=@_;
  my ($found)=0;

  filter_add( 
    sub {
      my ($status) ;

      if (($status = filter_read()) > 0) {
        if ($found == 0 and /Steps\(/) { 
	  $_ = "Steps(\n";
	  $found = 1; 
        }
        if ($found) {
	  if (/;\s*\z/) {
	     filter_del();
	  } elsif (/\b(?<trans>FAILURE|ALWAYS)\(\s*(?<func_call>\w.*?)\(\s*(?<args>.*)\)\s*\)\s*\,\s*\z/) {
	    my $trans     = $+{trans};
	    my $func_call = $+{func_call};
	    my $args      = $+{args};
	    $args =~ s/\s*=>//g;
	    my @args = split/ /,$args;
	    my $str  = join ',', map{ "\"".  $_ . "\""} @args;
            $_ = "[ ('$trans', '$func_call', $str, ) ],\n";
          } else {
	    if (/\b(?<func_call>\w.*?)\(\s*(?<args>.*)\)\s*\,\s*\z/) {
	      my $func_call = $+{func_call};
	      my $args      = $+{args};
	      $args =~ s/\s*=>//g;
	      my @args = split/ /,$args;
	      my $str  = join ',', map{ "\"".  $_ . "\""} @args;
              $_ = "[ ('$func_call', $str, ) ],\n";
	    }
	  }
        }
      }
      $status ;
    } 
 )
}
1 ;
