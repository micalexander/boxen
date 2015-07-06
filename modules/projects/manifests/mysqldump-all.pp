class projects::mysqldump-all {

  file {
    [
      "${::boxen_srcdir}/mysql",
      "${::boxen_srcdir}/mysql/bin",
      "${::boxen_srcdir}/mysql/dumps"
    ]:
    ensure => "directory",
  }

  file { "${::boxen_srcdir}/mysql/bin/mysqldump-all.sh":
    ensure => "file",
    mode   => "+x",
    content => template("${::boxen_repodir}/modules/projects/manifests/mysqldump-all/mysqldump-all.sh.erb"),
  }

  file { "${::boxen_srcdir}/mysql/${::boxen_user}.mysqldump-all.plist":
    ensure => "file",
    content => template("${::boxen_repodir}/modules/projects/manifests/mysqldump-all/mysqldump-all.erb"),
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/${::boxen_user}.mysqldump-all.plist":
    ensure  => "link",
    target  => "${::boxen_srcdir}/mysql/${::boxen_user}.mysqldump-all.plist"
  }

  exec { 'Launch mysqldump-all.plist':
    command => "/bin/launchctl load /Users/${::boxen_user}/Library/LaunchAgents/${::boxen_user}.mysqldump-all.plist",
    require => File["/Users/${::boxen_user}/Library/LaunchAgents/${::boxen_user}.mysqldump-all.plist"],
  }

}
