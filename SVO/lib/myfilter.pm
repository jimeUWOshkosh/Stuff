package myfilter;
use Filter::Simple;
FILTER {
	my @lines = split/\n/;
	foreach (@lines) {
	  s/=>//g if (
  	  s/\b(?<pgm>FAILURE|ALWAYS)\(\s*(?<func_call>\w.*)\(\s*(?<args>.*)\)\s*\)\s*\,\s*\z/[('$+{pgm}', '$+{func_call}', "$+{args}")],/);

	}
	push @lines, "1;\n";
	$_ = join "\n",@lines;
}
1;
