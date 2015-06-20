# Public: Installs Silverlight
#
# Example
#
#   include silverlight

class silverlight {
  package { 'Silverlight':
    ensure   => 'installed',
    provider => 'pkgdmg',
    source   => 'http://silverlight.dlservice.microsoft.com/download/D/6/6/D66CF013-1021-437B-9A65-983871CCB3E6/30317.00/Silverlight.dmg',
  }
}
