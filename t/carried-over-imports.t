use strict;
use warnings;

use Carp qw(cluck);
$SIG{__WARN__} = 'cluck';

use lib 't/lib';
use UsesTestMost;

use Test::Most qw(!any); # exclude an import that has already been imported in UsesTestMost
use List::Util qw(any);

is_it_one(1);

done_testing;
