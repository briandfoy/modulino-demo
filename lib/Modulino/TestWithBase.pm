use v5.14;

package Modulino::TestWithBase;
use utf8;
use strict;
use warnings;

our $VERSION = '1.003';

require Modulino::Base;

=encoding utf8

=head1 NAME

Modulino::TestWithBase - A demonstration of module ideas

=head1 SYNOPSIS

This module isn't meant for use. It's an example of the modulino idea
with an additional branch to recognize test situations then run as a
test file.

=head1 DESCRIPTION

I wrote this module as a demonstration of some ideas for I<Mastering
Perl>'s modulino chapter. This module loads Modulino::Base to handle
the modulino portions of the module.

In particular, this modulino has a special test more. If C<CPANTEST>
is a true value, it runs the module as a test file. That mode will
look for methods that start with C<_test_>.

This also handles the normal "run as application" modulino idea if the

=over 4

=item run

=cut

sub run {
	say "Running as program";
	}

sub _test_run {
	require Test::More;

	Test::More::pass();
	Test::More::pass();

	SKIP: {
		Test::More::skip( "These tests don't work", 2 );
		Test::More::fail();
		Test::More::fail();
		}
	}

=back

=head2 Testing

=over 4

=item test

Run all of the subroutines that start with C<_test_>. Each subroutine
is wrapped in a C<Test::More> subtest.

=back

=head1 TO DO


=head1 SEE ALSO


=head1 SOURCE AVAILABILITY

This source is in Github:

	https://github.com/briandfoy/modulino-demo/

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright © 2012-2021, brian d foy <bdfoy@cpan.org>. All rights reserved.

You may redistribute this under the terms of the Artistic License 2.0.

=cut

1;
