class logwatch(
  $email = $logwatch::params::email
) inherits logwatch::params {
  package { 'logwatch':
    ensure => present
  }

  file { '/etc/logwatch/conf/logwatch.conf':
    ensure => present,
    content => template("logwatch/logwatch.conf.erb"),
    owner => 'root',
    group => 'root',
    mode => 0644,
    require => Package['logwatch']
  }
}
