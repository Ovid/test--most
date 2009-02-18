use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Test::Most',
    license           => 'perl',
    dist_author       => 'Curtis Poe <ovid@cpan.org>',
    dist_version_from => 'lib/Test/Most.pm',
    requires          => {
        'Exception::Class'  => 1.14,
        'Test::More'        => 0.82,
        'Test::Exception'   => 0,
        'Test::Differences' => 0,
        'Test::Deep'        => 0,
        'Test::Harness'     => 3.07,
        'Test::Warn'        => 0.10,
        'perl'              => '5.006',
    },
    recommends => {
        'Data::Dumper::Names' => 0.03,
    },
    add_to_cleanup     => ['Test-Most-*'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
