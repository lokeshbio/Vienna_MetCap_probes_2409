#!/usr/bin/perl -w
##### Program description #######
#
# Title: grep -f for long files
#
# Author(s): Lokeshwaran Manoharan
#
#
# Description: choose lines from the list with headers in the argument file
#
# List of subroutines:
#
#
# Overall procedure: take headers from the headers file and extract the corresponding line from
#                    the blast-tab file.
#
# Usage: ./grep_f_long.pl headfile fasta_file out_file
#
##################################

my %hash;


my $head_file=$ARGV[0];
open my $HEADFILE, '<', $head_file or die "cannot open $head_file : $!";

my $blast_file=$ARGV[1];
open my $BLASTFILE, '<', $blast_file or die "cannot open $blast_file : $!";

my $main_file = $ARGV[2];
open my $OUTFILE, '>', $main_file or die "cannot open $main_file : $!";

my $count = 0;
while(my $line = <$HEADFILE>){
        chomp $line;
        if($count > 0){
                my @tmp = split (/\t/,$line);
                $hash{$tmp[0]}=1;
        }
        $count += 1;
}

$count = 0;
while(my $line = <$BLASTFILE>){
        chomp $line;
        if($line =~ /\>/){
          my @tmp = split (/\s/,$line);
          $tmp[0] =~ s/\>//;
          unless(defined $hash{$tmp[0]}){
                $count = 1;
                print $OUTFILE "$line\n";
          }
        }
        elsif($count ==1){
                print $OUTFILE "$line\n";
                $count = 0;
        }
}

close $HEADFILE;
close $BLASTFILE;
