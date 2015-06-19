# Public: Install Divvy.app to /Applications.
#
# Examples
#
#   include divvy
class divvy {
  package { 'Divvy':
    source   => 'http://mizage.com/downloads/Divvy.zip',
    provider => 'compressed_app'
  }

  # Enable access for assistive devices:
  file { '/private/var/db/.AccessibilityAPIEnabled':
    ensure => file,
  }
}
