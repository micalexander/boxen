class projects::nginx-default (

  $phpversion

  ) {

  include nginx::config

  # overide the creation nginx module nginx.conf with my own thanks to http://serverfault.com/a/439004
  File <| title == "${::boxen_home}/config/nginx/nginx.conf" |> {

    content => template("${::boxen_repodir}/modules/projects/manifests/nginx-default/nginx-default.erb"),

  }

  file {
    [
      "${::boxen_srcdir}/nginx",
      "${::boxen_srcdir}/nginx/sites",
    ]:
      ensure => "directory",
  }

  File <| title == "${::boxen_home}/config/nginx/sites" |> {
    ensure => "link",
    target => "${::boxen_srcdir}/nginx/sites",
    force  => true,
  }

}
