require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $::boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $::boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {

  homebrew::tap { 'homebrew/dupes': }
  homebrew::tap { 'homebrew/homebrew-php': }
  homebrew::tap { 'caskroom/versions': }
  homebrew::tap { 'caskroom/fonts': }

  # fail if FDE is not enabled
  #if $::root_encrypted == 'no' {
    #fail('Please enable full disk encryption and try again')
  #}

  # node versions
  nodejs::version { 'v0.6': }
  nodejs::version { 'v0.8': }
  nodejs::version { 'v0.10': }

  # install and set global node version
  class { 'nodejs::global':
    version => 'v0.12.6'
  }

  # php versions
  php::version { '5.4': }

  # install and set global php version
  class { 'php::global':
    version => '5.5.26'
  }

  # install php-fpm and configure
  php::fpm { '5.5.26': }

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  # install and set global ruby version
  class { 'ruby::global':
    version => '2.2.2'
  }

  # common, useful packages
  # package {
  #   [
  #     'ack',
  #     'findutils',
  #     'gnu-tar'
  #   ]:
  # }

  file { "${boxen::config::srcdir}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
