use ExtUtils::MakeMaker;

require 5.012;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'	       => 'Modulino::Demo',
	'ABSTRACT'     => 'A demonstration of various modulino ideas',
	'VERSION_FROM' => 'lib/Modulino/Demo.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Test::More' => '0',
		},

	clean  => { FILES    => q|Modulino-Demo-*| },
	);
