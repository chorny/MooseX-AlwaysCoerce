package MooseX::AlwaysCoerce;

use strict;
use warnings;

=head1 NAME

MooseX::AlwaysCoerce - Automatically enable coercions for Moose attributes

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    package MyClass;

    use Moose;
    use MooseX::AlwaysCoerce;
    use MyTypeLib 'SomeType';

    has foo => (is => 'rw', isa => SomeType); # will be coerced

=head1 AUTHOR

Rafael Kitover, C<< <rkitover at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-alwayscoerce at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-AlwaysCoerce>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find more information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-AlwaysCoerce>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-AlwaysCoerce>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-AlwaysCoerce>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-AlwaysCoerce/>

=back

=head1 ACKNOWLEDGEMENTS

My own stupidity, for inspiring me to write this module.

=head1 COPYRIGHT & LICENSE

Copyright (c) 2009 Rafael Kitover

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of MooseX::AlwaysCoerce
