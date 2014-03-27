#!/usr/bin/perl 

# 
# Script to manipulate data files for gnuplot
#

$IN = "data.dat";
$OUT = ">data_mod.dat";
$header_written  = 0;

($factor1, $factor2) = @ARGV;

#$factor1 = 1/120;
#$factor2 = 1/100;

open IN or die "Datei $IN der Daten $! nicht gefunden\n";
open OUT or die "Die Datei $OUT kann nisht angelegt werden\n";

while (<IN>) {
	chop;
	if (/^#/ and not $header_written) { 
		#
		# modify header and add scaling factors
		#
		print OUT $_."\n";
		print OUT "#\n";
		print OUT "# on ".`date`;
		print OUT "# modified by scale_data.pl\n";
		print OUT "# scaled by $factor1 and $factor2\n";
		print OUT "#\n";
		$header_written = 1;
	} else {
		#
		# scale values
		#
		($eins, $zwei) = split(/ /);
		print OUT $eins*$factor1." ".$zwei*$factor2."\n";
	}

}
close OUT;
close IN;
