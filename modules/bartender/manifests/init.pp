# Public: Install Bartender app into /Applications
#
# Examples
#
#   include bartender
class bartender {
  package { 'Bartender':
   provider => 'compressed_app',
   source   => 'http://www.macbartender.com/Demo/Bartender.zip'
  }
}
