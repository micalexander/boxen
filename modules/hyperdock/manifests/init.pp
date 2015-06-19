# Publid: Install HyperDock to /Applications
#
# Examples
#
#  include hyperdock
class hyperdock {
  package { 'HyperDock':
    provider => 'pkgdmg',
    source   => 'http://hyperdock.bahoom.com/download/HyperDock.dmg',
  }
}
