# Public: Install Evernote.app into /Applications.
#
# Examples
#
#   include evernote
class evernote {
  package { 'evernote':
    provider => 'appdmg_eula',
    source   => 'http://cdn1.evernote.com/mac/release/Evernote_402628.dmg'
  }
}
