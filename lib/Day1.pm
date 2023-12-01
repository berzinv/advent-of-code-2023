use v5.38;

package Day1;

use Exporter qw(import);
our @EXPORT_OK = qw(problem1 problem2);

use List::Util qw(sum);

sub extract_calibration_values(@data) {
    return map {
	my @values = $_ =~ /(\d)/g;
	"$values[0]$values[-1]";
    } @data;
}


sub problem1(@data) {
    return sum extract_calibration_values @data;
}


sub extract_digits($data) {
    my %digits = qw(one 1 two 2 three 3 four 4 five 5 six 6 seven 7 eight 8 nine 9);
    my @first_digit = $data =~ /(\d|one|two|three|four|five|six|seven|eight|nine)/;
    my @last_digit = $data =~ /.*(\d|one|two|three|four|five|six|seven|eight|nine)/;
    my $calibration_values = "$first_digit[0]$last_digit[0]";
    $calibration_values =~ s/(@{[join '|', map { quotemeta($_) } keys %digits]})/$digits{$1}/g;
    return $calibration_values;
}

sub problem2(@data) {
    return sum map { extract_digits $_ } @data;
}

1;
