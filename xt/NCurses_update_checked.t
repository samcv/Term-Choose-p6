use v6;
use Test;

plan 1;

use LWP::Simple;


my $url = 'https://modules.perl6.org/';
my $html = LWP::Simple.get( $url );

my $expected = '2016-04-06';
my $got      = '0000-00-00';

if $html ~~ /
        'href="https://github.com/azawawi/perl6-ncurses'
        [.<!before updated>]+
        'class="updated">'
        \s*
        ( \d ** 4 \- \d ** 2 \- \d ** 2 )
    /
{
    $got = $0;
}

is( $expected, $got, 'NCurses: no unchecked update.' );