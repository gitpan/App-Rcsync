
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Sync configuration files across machines',
  'AUTHOR' => 'Peter Shangov <pshangov@yahoo.com>',
  'BUILD_REQUIRES' => {
    'App::Cmd::Tester' => '0',
    'File::Find' => '0',
    'File::Slurp' => '0',
    'File::Temp' => '0',
    'Test::Differences' => '0',
    'Test::More' => '0',
    'Try::Tiny' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-Rcsync',
  'EXE_FILES' => [
    'bin/rcsync'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'App::Rcsync',
  'PREREQ_PM' => {
    'App::Cmd::Simple' => '0',
    'Carp' => '0',
    'Config::General' => '0',
    'Data::AsObject' => '0',
    'File::HomeDir' => '0',
    'File::Spec' => '0',
    'Template' => '0'
  },
  'VERSION' => '0.01',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



