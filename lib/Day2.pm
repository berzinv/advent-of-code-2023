use v5.38;

package Day2;

use Exporter qw(import);
our @EXPORT_OK = qw(problem1 problem2);

use builtin qw(true);

use String::Util qw(trim);
use List::Util qw(sum);

sub parse_color($color) {
    my ($count, $name) = split ' ', $color;
    return $count, $name;
}

sub parse_set($set) {
    my %colors = qw(red 0 green 0 blue 0);
    my @parts = split ',', $set;

    for my $color (@parts) {
	my ($count, $name) = parse_color($color);

	$colors{$name} = $count;
    }

    return $colors{red}, $colors{green}, $colors{blue};
}


sub is_valid_set($set, $max_red, $max_green, $max_blue) {
    my ($red, $green, $blue) = parse_set($set);
    return $red <= $max_red && $green <= $max_green && $blue <= $max_blue;
}

sub is_valid_game($game, $max_red, $max_green, $max_blue) {
    my ($game_name, $sets_data) = split ':', $game;
    my ($unused, $game_id) = split ' ', $game_name;
    
    my @sets = split ';', trim $sets_data;

    my $is_valid = true;
    for my $set (@sets) {
	$is_valid &&= is_valid_set trim($set), $max_red, $max_green, $max_blue;
    }

    return $game_id, $is_valid;
}

sub problem1(@data) {
    my @valid_games = ();
    
    for my $game (@data) {
	my ($game_id, $is_valid) = is_valid_game($game, 12, 13, 14);
	push @valid_games, ($game_id) if $is_valid;
    }

    return sum @valid_games;
}

sub fewer_number_of_cubes($game) {
    my ($max_red, $max_green, $max_blue) = (0, 0, 0);
    my ($game_name, $sets_data) = split ':', $game;
    
    my @sets = split ';', trim $sets_data;

    for my $set (@sets) {
	my ($red, $green, $blue) = parse_set trim($set);
	$max_red = $red if $red > $max_red;
	$max_green = $green if $green > $max_green;
	$max_blue = $blue if $blue > $max_blue;
    }

    return $max_red, $max_green, $max_blue;
}

sub power_of_a_set_of_cubes($red, $green, $blue) {
    return $red * $green * $blue;
}

sub problem2(@data) {
    return sum map { power_of_a_set_of_cubes fewer_number_of_cubes $_ } @data;
}

1;
