use v5.38;

use Test::Simple tests => 4;
use File::Slurp;

use Day1 qw(problem1 problem2);

# DAY 1 #

## Sample
my @data1sample = read_file("data/2023.day1.sample.txt");
ok(problem1(@data1sample) eq 142, "2023 day 1 problem 1 sample");

## Problem 1
my @data = read_file("data/2023.day1.txt");
ok(problem1(@data) eq 55017, "2023 day 1 problem 1");

## Problem 2 sample
my @data2sample = read_file("data/2023.day1.2.sample.txt");
ok(problem2(@data2sample) eq 281, "2023 day 1 problem 2 sample");

## problem 2
ok(problem2(@data) eq 53539, "2023 day 1 problem 2");

