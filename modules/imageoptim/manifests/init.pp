# Public: Install ImageOptim.app into /Applications.
#
# Examples
#
#   include imageoptim
#
class imageoptim {
  package { 'ImageOptim':
    provider => 'compressed_app',
    source   => 'http://imageoptim.com/ImageOptim.tbz2',
    flavor   => 'tbz'
  }
}
