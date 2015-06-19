# Teamviewer puppet.
class teamviewer {
  package { 'TeamViewer':
    provider => 'pkgdmg',
    source   => 'http://download.teamviewer.com/download/TeamViewer.dmg',
  }
}
