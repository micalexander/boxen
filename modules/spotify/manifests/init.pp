# Public: Install Spotify.app to /Applications.
#
# Examples
#
#   include spotify
class spotify {
  $install_file = '/Applications/Install\ Spotify.app'

  package { 'Install Spotify':
    provider => 'compressed_app',
    source   => 'http://download.spotify.com/SpotifyInstaller.zip',
  }
  ~> exec { 'Install Spotify':
    command     => "/usr/bin/open ${install_file}",
    logoutput   => 'on_failure',
    refreshonly => true,
  }
  -> file { $install_file:
    ensure => 'absent',
  }
}
