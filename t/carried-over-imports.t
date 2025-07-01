use strict;
use warnings;

use Carp qw(cluck);
BEGIN {
    $SIG{__WARN__} = sub {
        cluck($_[0]); fail("unexpected warning: $_[0]");
    }
}

use Exporter ();
my $orig_import = Exporter->can('import');
*Exporter::import = sub {
    cluck("Exporter::import called\n");
    goto $orig_import;
};

use lib 't/lib';
use UsesTestMost;

use Test::Most qw(!any); # exclude an import that has already been imported in UsesTestMost
use List::Util qw(any);

is_it_one(1);

done_testing;
