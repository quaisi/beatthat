#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use 5.010;

say "******************************BEAT THAT******************************";

my $total = 0;
my $again = 1;


while ($again == 1){
    for (1..10){

        my $rand1 = int(rand(10) + 1);
        my $rand2 = int(rand(10) + 1);
        my $answer = $rand1 * $rand2;

        print "What is $rand1 x $rand2: ";
        chomp (my $input = <STDIN>);
        if ($input == $answer) {
            $total ++;
        }
    }

    say "You got $total out of 10 correct";
    say "Type yes to go again: ";
    chomp (my $input = <STDIN>);
    $again = 0 unless $input =~ /yes/i;
}

