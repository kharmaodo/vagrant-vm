class apache::httpd {
  group { 'apache':
    ensure  => present,
  }

  user { 'apache':
    comment => 'Apache httpd server user',
    gid => 'apache',
    home => '/home/apache',
    managehome => true,
    shell => '/bin/bash',
    require => Group['apache'],
  }

  package { 'httpd':
    ensure => present,
    require => User['apache'],
  }

  service { 'httpd':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package['httpd'],
  }
}
