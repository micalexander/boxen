# Public: Install Opera Developer to /Applications.
#
# Examples
#
#   include opera::developer
class opera::developer {
  package { 'Opera-Developer':
    provider => 'appdmg_eula',
    source   => 'http://get.geo.opera.com/pub/opera-developer/23.0.1499.0/mac/Opera_Developer_23.0.1499.0_Setup.dmg'
  }
}
