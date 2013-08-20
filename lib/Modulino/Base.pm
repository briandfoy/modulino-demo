package Modulino::Base;
use utf8;
use strict;
no warnings;

use v5.10.1;

use vars qw($VERSION);
use Carp;

our $VERSION = '0.10_01';

sub _running_under_tester { !! $ENV{CPANTEST} }

sub _running_as_app {
	my $caller = scalar caller(1);
	print "in _running_as_app, caller is $caller\n";
	(defined $caller) && $caller ne 'main';
	}

# run directly
if( ! defined caller(0) ) {
	carp "You cannot run this module directly\n";
	}
# loaded from a module that was run directly
elsif( ! defined caller(1) ) {
	my @caller = caller(0);
	print "caller is [@caller]\n";
	my $method = do {
		   if( _running_under_tester()    ) { 'test' }
		elsif( _running_as_app()          ) { 'run'  }
		else                                { undef  }
		};

	if( defined $method ) {
		unless( $caller[0]->can( $method ) ) {
			carp "There is no $method() method defined in $caller[0]\n";	
			}

		$caller[0]->$method(@ARGV) if defined $method;
		}	
	}


1;
