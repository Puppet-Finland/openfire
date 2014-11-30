#
# == Class: openfire::install
#
# This class fetches and installs OpenFire.
#
class openfire::install inherits openfire::params
{
    include os::params

    exec { 'openfire-fetch':
        command => "wget ${::openfire::params::package_baseurl}/${::openfire::params::package_name}",
        cwd => "${::openfire::params::basedir}",
        path => ['/bin', '/usr/bin', '/usr/local/bin', '/sbin/', '/usr/sbin', '/usr/local/sbin' ],
        creates => "${::openfire::params::basedir}/${::openfire::params::package_name}",
        user => root,
        timeout => 600,
    }

    exec { 'openfire-install':
        command => "${::os::params::package_install_cmd} ${::openfire::params::basedir}/${::openfire::params::package_name}",
        path => ['/bin', '/usr/bin', '/usr/local/bin', '/sbin/', '/usr/sbin', '/usr/local/sbin' ],
        creates => "${::openfire::params::install_dir}",
        user => root,
        require => Exec['openfire-fetch'],
    }
}

