class ruby::rails {
  include ruby::base

  package { 'rails':
    provider => gem,
    ensure   => '3.2.13',
    require  => Class['ruby::base'],
  }

  package { ['sqlite3', 'libsqlite3-dev', 'libpq-dev']:
    ensure => present,
  }
}

