# UWSGI Application Processing.
# We use UWSGI-EMPEROR 
class uwsgi {

  package { ['uwsgi','uwsgi-emperor','uwsgi-plugin-python']:
    ensure  => installed,
  }
  
  service { "uwsgi":
    ensure  => running,
    require => Package['uwsgi'],
  }
  
  service { "uwsgi-emperor":
    ensure  => running,
    require => Package['uwsgi-emperor'],
  }

  file { "/etc/uwsgi-emperor/emperor.ini":
    ensure  => file,
    owner   => "0",
    group   => "0",
    mode    => "0644",
    content => template('uwsgi/emperor.ini.erb'),
    require => Package['uwsgi-emperor'],
    notify  => Service['uwsgi-emperor'],
  }
}
