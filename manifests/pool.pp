define uwsgi::pool(
  $appname     = $name,
  $wsgi_module = undef,
  $chdir_uid   = "www-data",
  $chdir_gid   = "www-data",
){
  include uwsgi

  file { "${appname}_pool.ini":
    ensure  => file,
    path    => "/etc/uwsgi-emperor/vassals/${appname}.ini",
    owner   => "0",
    group   => "0",
    mode    => "0644",
    content => template('uwsgi/pool.ini.erb'),
  }
  file { "${appname}_log":
    ensure  => file,
    path    => "/var/log/uwsgi/${appname}.log",
    owner   => "${chdir_uid}",
    group   => "${chdir_gid}",
    mode    => "0644",
  }
}
