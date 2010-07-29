#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

BEGIN {
    if (eval { require MooseX::Role::Parameterized }) {
        plan tests => 8;
    } else {
        plan skip_all => 'This test needs MooseX::Role::Parameterized';
    }
}

{
    package Role;
    use MooseX::Role::Parameterized;
    use MooseX::AlwaysCoerce;
    use Moose::Util::TypeConstraints;

    # I do nothing!
    role {};
    use Moose::Util::TypeConstraints;

    subtype 'MyType', as 'Int';
    coerce 'MyType', from 'Str', via { length $_ };

    subtype 'Uncoerced', as 'Int';

    has foo => (is => 'rw', isa => 'MyType');

    class_has bar => (is => 'rw', isa => 'MyType');

    class_has baz => (is => 'rw', isa => 'MyType', coerce => 0);

    has quux => (is => 'rw', isa => 'MyType', coerce => 0);

    has uncoerced_attr => (is => 'rw', isa => 'Uncoerced');

    class_has uncoerced_class_attr => (is => 'rw', isa => 'Uncoerced');
}

{
    package Foo;
    use Moose;
    with 'Role';
}

package main;
use Test::Exception;
use Test::NoWarnings;

ok( (my $instance = MyClass->new), 'instance' );

lives_ok { $instance->foo('bar') } 'attribute coercion ran';

lives_ok { $instance->bar('baz') } 'class attribute coercion ran';

dies_ok { $instance->baz('quux') }
    'class attribute coercion did not run with coerce => 0';

dies_ok { $instance->quux('mtfnpy') }
    'attribute coercion did not run with coerce => 0';

lives_ok { $instance->uncoerced_attr(10) }
    'set attribute having type with no coercion and no coerce=0';

lives_ok { $instance->uncoerced_class_attr(10) }
    'set class attribute having type with no coercion and no coerce=0';


