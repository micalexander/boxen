# == Class: xscope::2
#
# Installs the older version of the Xscope Mac application
#
# === Authors
#
# Robby Colvin <geetarista@gmail.com>
#
class xscope::2 inherits xscope {
  Package['XScope'] {
    source   => 'http://iconfactory.com/assets/software/xscope/xScope_251.zip',
  }
}
