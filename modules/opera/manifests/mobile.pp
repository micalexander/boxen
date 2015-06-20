# Public: Install Opera Mobile Classic Emulator to /Applications.
#
# Examples
#
#   include opera::mobile
class opera::mobile {
  package { 'Opera-Mobile':
    provider => 'appdmg_eula',
    source   => 'http://get.geo.opera.com/pub/opera/sdlbream/1210/Opera_Mobile_Emulator_12.1_Mac.dmg'
  }
}
