# Increase the open file limits for the holberton user.
exec { 'change-os-configuration-for-holberton-user':
  command => '/bin/sed -i -e "s/^holberton hard nofile [0-9]*/holberton hard nofile 4096/" -e "s/^holberton soft nofile [0-9]*/holberton soft nofile 4096/" /etc/security/limits.conf',
  unless  => '/bin/grep -q "^holberton hard nofile 4096$" /etc/security/limits.conf && /bin/grep -q "^holberton soft nofile 4096$" /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
}
