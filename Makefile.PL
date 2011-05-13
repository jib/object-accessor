use ExtUtils::MakeMaker;
use strict;

WriteMakefile (
    NAME            => 'Object::Accessor',
    VERSION_FROM    => 'lib/Object/Accessor.pm', # finds $VERSION
    dist            => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
    PREREQ_PM       => {    'Carp'          => 0,
                            'Test::More'    => 0,
                            'Params::Check' => '0.23',
                    },
    INSTALLDIRS     => ( $] >= 5.009005 ? 'perl' : 'site' ),
    AUTHOR          => 'Jos Boumans <kane[at]cpan.org>',
	ABSTRACT        => 'Per object accessors'
);
