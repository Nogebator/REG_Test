#!/usr/bin/perl

my $input = '2016-04-11 20:59:03';

$input =~ m/^(\d{4}-\d{2}-\d{2})\s(\d{2}:\d{2}:\d{2})$/;
my ($date, $time) = ($1, $2);
