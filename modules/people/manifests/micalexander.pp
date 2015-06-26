class people::micalexander {

  include people::micalexander::git
  include people::micalexander::prefpane
  include projects::all

  osx::recovery_message { 'If this Mac is found, please call +1.623.204.5592': }
}