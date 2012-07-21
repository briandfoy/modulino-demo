use Test::More;

my @classes = qw(
	Modulino::Demo
	Modulino::Demo2
	);
	
foreach my $class ( @classes ) {
	subtest $class => sub {
		eval "require $class" or warn "$class $@";
		};
	}

done_testing();
