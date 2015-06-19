# Public: Install Skitch 2.0.
#
# Usage:
#
#   include skitch
class skitch {
  package { 'Skitch':
    provider => 'compressed_app',
    source   => 'http://cdn1.evernote.com/skitch/mac/release/Skitch-2.7.2.zip'
  }
}
