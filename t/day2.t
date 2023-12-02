use v5.38;

use Test::Simple tests => 4;
use File::Slurp;

use Day2 qw(problem1 problem2);

# problem 1 sample
my @datasample = read_file("data/day2.1.sample.txt");
ok(problem1(@datasample) == 8, "Day 2 problem 1 sample");

# problem 1 sample
my @data = read_file("data/day2.1.txt");
my $problem1result = problem1(@data);
say $problem1result;
ok($problem1result == 2237, "Day 2 problem 1");

# problem 2 sample
my $problem2sampleresult = problem2(@datasample);
ok($problem2sampleresult == 2286, "Day 2 problem 2 sample");

# problem 2
my $problem2result = problem2 @data;
say $problem2result;
ok($problem2result == 66681, "Day 2 problem 2");
