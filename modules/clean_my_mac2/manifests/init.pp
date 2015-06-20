# Public: Install CleanMyMac2.app into /Applications.
#
# Examples
#
#   include clean_my_mac2
class clean_my_mac2 {
  package { 'CleanMyMac2':
    provider => 'appdmg',
    source   => 'http://dl.devmate.com/com.macpaw.CleanMyMac2/CleanMyMac2.dmg'
  }
}
