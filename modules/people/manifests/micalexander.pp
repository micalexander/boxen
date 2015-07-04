class people::micalexander {

  ruby_gem { 'bundler for 2.2.2':
    gem          => 'bundler',
    version      => '~> 1.10',
    ruby_version => '2.2.2',
  }

  nodejs::module { 'bower':
    node_version => 'v0.10.31'
  }

  osx::recovery_message { 'If this Mac is found, please call +1.623.204.5592': }
}