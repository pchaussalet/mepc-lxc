Exec {
  path => ['/usr/bin', '/bin', '/usr/sbin', '/sbin', '/usr/local/bin'],
}

class puppetmaster {
  package {'wget':
    ensure => installed,
  }

  exec {'dl puppetlabs-release':
    command => 'wget -O /tmp/puppetlabs-release-quantal.deb http://apt.puppetlabs.com/puppetlabs-release-quantal.deb',
    require => Package['wget'],
    onlyif => 'dpkg -l puppetlabs-release 2>/dev/null; [ $? -eq 1 ]',
  }

  package {'puppetmaster':
    ensure => installed,
    require => Exec['dl puppetlabs-release'],
  }
}

include puppetmaster
