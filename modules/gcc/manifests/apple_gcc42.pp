# gcc::apple_gcc42
#
# Installs apple-gcc42 via homebrew, only on Darwin
class gcc::apple_gcc42 {
  case $::operatingsystem {
    'Darwin': {
      include homebrew

      homebrew::formula { 'apple-gcc42':
        before => Package['boxen/brews/apple-gcc42'],
      }

      package { 'boxen/brews/apple-gcc42':
        ensure => '4.2.1-5666.3-boxen2',
        alias  => 'apple-gcc42',
      }
    }

    default: {
      # noop
    }
  }
}
