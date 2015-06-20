# Public: Install Latest Fantastical.app into /Applications.
#
# Examples
#
#   include fantastical
class fantastical {
  package { 'Fantastical':
    provider => 'compressed_app',
    source   => 'http://flexibits.com/fantastical/download',
    flavor   => 'zip'
  }
}
