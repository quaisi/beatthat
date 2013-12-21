#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use 5.010;

say "******************************BEAT THAT******************************";

my $total = 0;
my $again = 1;
my $valid_input = 0;

while ($again == 1){
    for (1..10){

        my $rand1 = int(rand(10) + 1);
        my $rand2 = int(rand(10) + 1);
        my $answer = $rand1 * $rand2;

        while ($valid_input == 0) {
            print "What is $rand1 x $rand2: ";
            chomp (my $input = <STDIN>);
            if ($input =~ /\A(\d+)\z/){
                $valid_input = 1;
                if ($input == $answer) {
                    $total ++;

                }
            }
        }
        $valid_input = 0;
    }
    say "You got $total out of 10 correct";
    say "Type yes to go again: ";
    chomp (my $input = <STDIN>);
    $again = 0 unless $input =~ /yes/i;
}
