# Public: Install Skitch 1.0.
#
# Usage:
#
#   include skitch:v1
class skitch::v1 {
  package { 'Skitch':
    provider => 'compressed_app',
    source   => 'http://get.skitch.com/Skitch-1.0.12.zip'
  }
}
