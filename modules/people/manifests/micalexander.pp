class people::micalexander {

  homebrew::tap { 'caskroom/versions': }
  # homebrew::tap { 'homebrew/dupes': }
  # homebrew::tap { 'homebrew/homebrew-php': }

  include people::micalexander::git
  include projects::weekly-mysqldumps
  include projects::all

  sublime_text::package { 'Package Syncing':
    source => 'csch0/SublimeText-Package-Syncing'
  }

  php::fpm { '5.5.26': }

  class { 'ruby::global':
    version => '2.2.2'
  }

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.4.1',
    ruby_version => '*',
  }

  class { 'nodejs::global': version => 'v0.10.31' }

  nodejs::module { 'bower':
    node_version => 'v1.4.1'
  }
  class { 'osx::dock::icon_size':
    size => 50
  }

  class { 'osx::mouse::smart_zoom':
    enabled => true
  }

  osx::recovery_message { 'If this Mac is found, please call +1.623.204.5592': }
}