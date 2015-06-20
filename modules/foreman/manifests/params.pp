# Internal: Default params for foreman
class foreman::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $root = "${boxen::config::home}/foreman"
      $user = $::boxen_user
    }

    default: {
      $root = '/usr/local/share/foreman'
      $user = 'root'
    }
  }
}
