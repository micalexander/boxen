class people::micalexander {

  homebrew::tap { 'caskroom/versions': }
  include people::micalexander::git
  include projects::all

  sublime_text::package { 'Package Syncing':
    source => 'csch0/SublimeText-Package-Syncing'
  }

  osx::recovery_message { 'If this Mac is found, please call +1.623.204.5592': }
}