# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {

  case $::operatingsystem {
    'Darwin': {
      include homebrew

      case $::macosx_productversion_major {
        '10.8': {
          include gcc::apple_gcc42
        }

        '10.9': {
          ensure_resource('homebrew::tap',
            'homebrew/versions', { 'ensure' => 'present' })

          homebrew::formula { 'gcc48': }

          package { 'boxen/brews/gcc48':
            ensure  => '4.8.3-boxen2',
            require => Homebrew::Tap['homebrew/versions']
          }
        }

        '10.10': {
          ensure_resource('homebrew::tap',
            'homebrew/versions', { 'ensure' => 'present' })

          homebrew::formula { 'gcc48': }

          package { 'boxen/brews/gcc48':
            ensure  => '4.8.3-boxen2',
            require => Homebrew::Tap['homebrew/versions']
          }
        }

        default: {
          # noop
        }
      }
    }

    default: {
      package { 'gcc': }
    }
  }

}
