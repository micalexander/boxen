# Public: Install XtraFinder to /Applications
#
# Examples
#
#  include xtrafinder
class xtrafinder {
  package { 'XtraFinder.pkg':
    provider => 'pkgdmg',
    source   => 'http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg',
  }
}
