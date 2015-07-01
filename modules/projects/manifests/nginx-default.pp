class projects::nginx-default {

  file { "${::boxen_home}/config/nginx/sites/default":
    ensure => "file",
    content => template("${::boxen_repodir}/modules/projects/manifests/nginx-default/nginx-default.erb"),
  }

}
