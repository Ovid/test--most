require 5.006;
use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Test::Most',
    'VERSION_FROM' => 'lib/Test/Most.pm',
    'PREREQ_PM'    => {
        'Exception::Class'  => '1.14',
        'Test::Deep'        => '0.106',
        'Test::Differences' => '0.61',
        'Test::Exception'   => '0.31',
        'Test::Harness'     => '3.21',
        'Test::More'        => '0.88',
        'Test::Warn'        => '0.23'
    },
    'INSTALLDIRS' => 'site',
    'EXE_FILES'   => [],
    'PL_FILES'    => {},
    META_MERGE    => {
        "meta-spec" => { version => 2 },
        resources   => {
            repository => {
                type => 'git',
                url  => 'git@github.com:Ovid/test--most.github',
                web  => 'https://github.com/Ovid/test--most',
            },
        },
    },
);
