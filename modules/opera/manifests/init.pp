# Public: Install Opera to /Applications.
#
# Examples
#
#   include opera
class opera {
  package { 'Opera':
    provider => 'appdmg_eula',
    source   => 'http://get.geo.opera.com/pub/opera/desktop/21.0.1432.67/mac/Opera_21.0.1432.67_Setup.dmg'
  }
}
