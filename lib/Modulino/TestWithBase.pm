package Modulino::TestWithBase;
use utf8;
use strict;
use warnings;

use v5.10.1;

our $VERSION = '0.10_01';

require Modulino::Base;

=encoding utf8

=head1 NAME

__PACKAGE__ - A demonstration of module ideas

=head1 SYNOPSIS

	use __PACKAGE__;

=head1 DESCRIPTION

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

=cut

sub test {
	say "Running as test";

	my( $class ) = @_;
	my @tests = $class->_get_tests;

	require Test::More;

	foreach my $test ( @tests ) {
		Test::More::subtest( $test => sub {
			my $rc = eval { $class->$test(); 1 };
			Test::More::diag( $@ ) unless defined $rc;
			} );
		}
	
	Test::More::done_testing();
	}

sub _get_tests {
	my( $class ) = @_;
	no strict 'refs';
	my $stub = $class . '::';
	my @tests =
		grep { defined &{"$stub$_"}    }
		grep { 0 == index $_, '_test_' }
		keys %{ "$stub" };

	say "Tests are @tests";
	@tests;
	}

=head1 TO DO


=head1 SEE ALSO


=head1 SOURCE AVAILABILITY

This source is in Github:

	http://github.com/briandfoy/modulino-demo/

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2013, brian d foy, All Rights Reserved.

You may redistribute this under the same terms as Perl itself.

=cut

1;
