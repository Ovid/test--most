#!/usr/bin/perl

use strict;
use warnings;

use lib 'lib', 't/lib';
use Test::Most tests => 4;
use Data::Dumper;

no warnings 'redefine';

my @EXPLAIN;
local *Test::More::note = sub { @EXPLAIN = @_ };
explain 'foo';
eq_or_diff \@EXPLAIN, ['foo'], 'Basic explain() should work just fine';

my $aref = [qw/this that/];
{
    local $Data::Dumper::Indent   = 1;
    local $Data::Dumper::Sortkeys = 1;
    local $Data::Dumper::Terse    = 1;

    explain 'hi', $aref, 'bye';

    eq_or_diff \@EXPLAIN, [ 'hi', Dumper($aref), 'bye' ],
      '... and also allow you to dump references';
}

{
    my $expected;
    local $Data::Dumper::Indent = 1;
    $expected = Dumper($aref);
    $expected =~ s/VAR1/aref/;
    show $aref;

    SKIP: {
        eval "use Data::Dumper::Names ()";
        skip 'show() requires Data::Dumper::Names version 0.03 or better', 2
            if $@ or $Data::Dumper::Names::VERSION < .03;
        eq_or_diff \@EXPLAIN,  [$expected],
            '... and show() should try to show the variable name';

        show 3;
        chomp @EXPLAIN;
        eq_or_diff \@EXPLAIN, ['$VAR1 = 3;'],
            '... but will default to $VARX names if it can\'t';
    }
}
