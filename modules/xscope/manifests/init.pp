# == Class: xscope
#
# Installs the latest version of the Xscope Mac application
#
# === Authors
#
# Robby Colvin <geetarista@gmail.com>
#
class xscope {
  package { 'XScope':
    provider => 'compressed_app',
    source   => 'http://iconfactory.com/assets/software/xscope/xScope-3.5.2.zip',
  }
}
