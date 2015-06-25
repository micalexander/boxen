# Public: Install ScreenFlow.app into /Applications.
#
# Examples
#
#   include screenflow
class screenflow {
  package { 'ScreenFlow':
    provider => 'appdmg',
    source   => 'http://www.telestream.net/download-files/screenflow/4-0/ScreenFlow-4.0.5.dmg'
  }
}
