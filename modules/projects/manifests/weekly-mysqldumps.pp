class projects::weekly-mysqldumps {

  file { [
    "${::boxen_srcdir}/weekly-mysqldumps",
    "${::boxen_srcdir}/weekly-mysqldumps/bin",
    "${::boxen_srcdir}/weekly-mysqldumps/dumps"
  ]:
      ensure => "directory",
  }

  file { "${::boxen_srcdir}/weekly-mysqldumps/bin/weekly-mysqldumps.sh":
    ensure => "file",
    mode   => "+x",
    content => template("${::boxen_repodir}/modules/projects/manifests/weekly-mysqldumps/weekly-mysqldumps.sh.erb"),
  }

  file { "${::boxen_srcdir}/weekly-mysqldumps/${::boxen_user}.weekly-mysqldumps.plist":
    ensure => "file",
    content => template("${::boxen_repodir}/modules/projects/manifests/weekly-mysqldumps/weekly-mysqldumps.erb"),
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/${::boxen_user}.weekly-mysqldumps.plist":
    ensure  => "link",
    target  => "${::boxen_srcdir}/weekly-mysqldumps/${::boxen_user}.weekly-mysqldumps.plist"
  }

  exec { 'name':
    command      => "/bin/launchctl load /Users/${::boxen_user}/Library/LaunchAgents/${::boxen_user}.weekly-mysqldumps.plist",
    #refreshonly => true,
  }

}
