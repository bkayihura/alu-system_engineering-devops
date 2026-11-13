# Increase the open file limits for the holberton user.
exec { 'increase-holberton-hard-limit':
  command => '/bin/sed -i "s/holberton hard nofile 5/holberton hard nofile 4096/" /etc/security/limits.conf',
  unless  => '/bin/grep -q "^holberton hard nofile 4096$" /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
}

exec { 'increase-holberton-soft-limit':
  command => '/bin/sed -i "s/holberton soft nofile 4/holberton soft nofile 4096/" /etc/security/limits.conf',
  unless  => '/bin/grep -q "^holberton soft nofile 4096$" /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
}
