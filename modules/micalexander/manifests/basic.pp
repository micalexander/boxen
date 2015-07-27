class micalexander::basic {

  homebrew::tap { 'caskroom/versions': }

  # install and set global node version
  class { 'nodejs::global':
    version => 'v0.12.6'
  }

  nodejs::module { 'bower':
    node_version => 'v0.10.31'
  }

  # install and set global php version
  class { 'php::global':
    version => '5.5.26'
  }

  # install php-fpm and configure
  php::fpm { '5.5.26': }

  # default ruby versions
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
}
