class micalexander::development {

  homebrew::tap { 'caskroom/versions': }
  homebrew::tap { 'caskroom/fonts': }
  homebrew::tap { 'homebrew/dupes': }
  homebrew::tap { 'homebrew/homebrew-php': }
  homebrew::tap { 'homebrew/services': }

  # node versions
  nodejs::version { 'v0.6': }
  nodejs::version { 'v0.8': }
  nodejs::version { 'v0.10': }


  nodejs::module { 'bower':
    node_version => 'v0.10.31'
  }

  # install and set global node version
  class { 'nodejs::global':
    version => 'v0.12.6'
  }

  phantomjs::version { '2.0.0': }

  phantomjs::global { '2.0.0': }

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

  ruby_gem { 'bundler for 2.2.2':
    gem          => 'bundler',
    version      => '~> 1.10',
    ruby_version => '2.2.2',
  }

  class { 'vagrant': }

  include docker
  include nginx
  include mysql

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }
}
