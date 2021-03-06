use v6;

sub prob(:$dna, :$gc-content) {
    1/2**$dna.chars *
    [*] map { $_ eq 'G'|'C' ?? $gc-content !! (1 - $gc-content) }, $dna.comb
}

my @data = $*IN.lines; # '10', 'AG', '0.25 0.5 0.75';
my $n = @data.shift;
my $s = @data.shift;
my @A = @data.shift.split: ' ';

my @B;

for @A -> $gc-content {
    push @B, ($n - $s.chars + 1) * prob :dna($s), :$gc-content;
}

say @B;


# vim: ft=perl6
