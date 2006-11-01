BEGIN { chdir 't' if -d 't' };

use strict;
use lib '../lib';
use Data::Dumper;

BEGIN {
    require Test::More;
    Test::More->import( 
        # silly bbedit [
        $] >= 5.008         
            ? 'no_plan' 
            : ( skip_all => "Lvalue objects require perl >= 5.8" )
    );
}

my $Class   = 'Object::Accessor';
my $LClass  =  $Class . '::Lvalue';

use_ok($Class);

my $Object      = $LClass->new;
my $Acc         = 'foo';

### stupid warnings
### XXX this will break warning tests though if enabled
$Object::Accessor::DEBUG = $Object::Accessor::DEBUG = 1 if @ARGV;


### check the object
{   ok( $Object,                "Object of '$LClass' created" );
    isa_ok( $Object,            $LClass );
    isa_ok( $Object,            $Class );
}

### create an accessor;
{   ok( $Object->mk_accessors( $Acc ),
                                "Accessor '$Acc' created" );
    
    eval { $Object->$Acc = $$ };
    ok( !$@,                    "lvalue assign successful $@" );
    ok( $Object->$Acc,          "Accessor '$Acc' set" );
    is( $Object->$Acc, $$,      "   Contains proper value" );
}
