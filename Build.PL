use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Test::Most',
    license           => 'perl',
    dist_author       => 'Curtis "Ovid" Poe <ovid@cpan.org>',
    dist_version_from => 'lib/Test/Most.pm',
    requires          => {
        'Exception::Class'  => '1.14',
        'Test::More'        => '0.88',
        'Test::Exception'   => '0.31',
        'Test::Differences' => '0.61',
        'Test::Deep'        => '0.106',
        'Test::Harness'     => '3.21',
        'Test::Warn'        => '0.23',
        'perl'              => '5.006',
    },
    meta_merge =>
      { resources => { repository => 'http://github.com/Ovid/test--most' } },
    recommends         => { 'Data::Dumper::Names' => 0.03, },
    add_to_cleanup     => ['Test-Most-*'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
