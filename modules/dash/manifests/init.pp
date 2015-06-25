# Public: Install Dash.app into /Applications.
#
# Examples
#
#   include dash
class dash {
  package { 'Dash':
    source   => 'http://kapeli.com/Dash.zip',
    provider => 'compressed_app'
  }
}
