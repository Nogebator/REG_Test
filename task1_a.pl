#!/usr/bin/perl

my $search = sprintf('%b', 18);
my @unsorted = qw /7 1 3 4 2 4 6 5 5 15 23 76 2 18 90 45 73/;

print "Content-Type: text/html; charset=utf-8\n\n";

my @sorted = @unsorted;
foreach (@sorted) {
	for (my $i=0; $i<$#sorted; $i++) {
	  if ($sorted[$i] > $sorted[$i+1]) {
		($sorted[$i], $sorted[$i+1]) = ($sorted[$i+1], $sorted[$i]);
	  }
	}
}


for (my $i=0; $i<=$#sorted; $i++) {
	if ($search == sprintf('%b', $sorted[$i])) {
		print "MATCH\n";
		last;
	}
	print "NOT_MATCH\n" if ($i == $#sorted);
}
