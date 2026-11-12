# Increase the Nginx open file limit to handle high traffic.
exec { 'increase_nginx_ulimit':
  command => '/bin/sed -i \'s/^ULIMIT="-n [0-9]*"/ULIMIT="-n 4096"/\' /etc/default/nginx',
  unless  => '/bin/grep -q \'^ULIMIT="-n 4096"$\' /etc/default/nginx',
  path    => ['/bin', '/usr/bin'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
