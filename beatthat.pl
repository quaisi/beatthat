#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use 5.010;

use DateTime;
use Term::Cap;

my $total       = 0;
my $again       = 1;
my $valid_input = 0;

my $terminal = Term::Cap->Tgetent( { OSPEED => 9600 } );
my $clear_string = $terminal->Tputs('cl');

print $clear_string;

my @incorrect_answers;

while ( $again == 1 ) {
    my $start_time = DateTime->now();
    say
    "****************************** BEAT THAT ******************************";
    for ( 1 .. 10 ) {

        my $rand1  = int( rand(10) + 1 );
        my $rand2  = int( rand(10) + 1 );
        my $answer = $rand1 * $rand2;

        while ( $valid_input == 0 ) {
            print "What is $rand1 x $rand2: ";
            chomp( my $input = <STDIN> );
            if ( $input =~ /\A(\d+)\z/ ) {
                $valid_input = 1;
                if ( $input == $answer ) {
                    $total++;
                }
                else {
                    push @incorrect_answers, "$rand1 x $rand2 = " . ($rand1 * $rand2);
                }

            }
        }
        $valid_input = 0;
    }
    my $end_time = DateTime->now();

    my $elapsed_time = $end_time - $start_time;

    say "You got $total out of 10 correct";
    say "\nYou did it in " . $elapsed_time->in_units('seconds') . " seconds";

    if (@incorrect_answers > 0 ) {
        say "\nHave a look at the ones you got wrong";

        foreach my $wrong_answer (@incorrect_answers){
            print $wrong_answer . "\n";
        }
        undef @incorrect_answers;
    }


    say "Type yes to go again: ";
    chomp( my $input = <STDIN> );
    $total = 0;
    $again = 0 unless $input =~ /^yes$/i;
}
