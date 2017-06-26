use strict; use warnings;
sub Steps {
   print "Steps\n";
   my (@args) = @_;
   my $rc =0;
   while (my ($i, $ref) = each @args) {
      print "$i\n";
      if ($ref->[0] !~ /(FAILURE|ALWAYS)/) {
         my $eles = scalar @$ref;
	 no strict 'refs';
         $rc = $ref->[0](@{$ref}[1..$eles]);
         last if (!$rc);
      }
   }
   if ($rc) {
      # find ALWAYS
      find_always(@args);
   } else {
      # find FAILURE and ALWAYS
      find_failure(@args);
      find_always(@args);
   }
   
}
sub find_always {
   print "find_always\n";
   my (@objects) = @_;
   foreach my $i (@objects) {
      if (ref ($i) eq 'ARRAY') {
        if ($i->[0] eq 'ALWAYS') {
           my $eles = scalar @$i;
	   no strict 'refs';
           $i->[1](@{$i}[2..$eles]);
        }
      }
   }
}
sub find_failure {
   print "find_failure\n";
   my (@objects) = @_;
   foreach my $i (@objects) {
      if (ref ($i) eq 'ARRAY') {
         if ($i->[0] eq 'FAILURE') {
            my $eles = scalar @$i;
	    no strict 'refs';
            $i->[1](@{$i}[2..$eles]);
         }
      }
   }
}
1;
