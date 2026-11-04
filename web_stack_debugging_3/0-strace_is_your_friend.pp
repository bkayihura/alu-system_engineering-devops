# Fix WordPress HTTP 500 error caused by an incorrect PHP filename.
exec { 'fix-wordpress':
  command => '/bin/sed -i s/class-wp-locale\.phpp/class-wp-locale.php/ /var/www/html/wp-settings.php',
  path    => ['/bin', '/usr/bin'],
  onlyif  => '/bin/grep -q class-wp-locale.phpp /var/www/html/wp-settings.php',
}
