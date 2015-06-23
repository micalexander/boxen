# Public: Install Evernote.app into /Applications.
#
# Examples
#
#   include evernote
class evernote (
  $sourceUri = 'https://evernote.com/download/get.php?file=EvernoteMac&boxen=/evernote_latest.dmg',
) {
  package { 'evernote':
    provider => 'appdmg_eula',
    source   => $sourceUri,
  }
}
