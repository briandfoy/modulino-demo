package Modulino::Base;
use utf8;
use strict;
use warnings;

use v5.10.1;

use vars qw($VERSION);
use Carp;

our $VERSION = '0.10_01';

sub _running_under_tester {
	!! $ENV{CPANTEST}
	}

sub _running_as_app {
	defined scalar caller;
	}

my @caller = caller();

if( $caller[0] ) {
	my $method = do {
		   if( _running_under_tester()    ) { 'test' }
		elsif( _running_as_app()          ) { 'run'  }
		else                                { undef  }
		};

	unless( $caller[0]->can( $method ) ) {
		carp "There is no $method() method defined in $caller[0]";	
		}

	$caller[0]->$method(@ARGV) if defined $method;
	}
else {
	warn "You have to load Modulino::Base from another module";
	}

1;
