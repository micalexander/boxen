# Public: Install Opera Mail to /Applications.
#
# Examples
#
#   include opera::mail
class opera::mail {
  package { 'Opera-Mail':
    provider => 'appdmg_eula',
    source   => 'http://get.geo.opera.com/pub/opera/mail/1.0/mac/Opera-Mail-1.0-1040.i386.dmg'
  }
}
