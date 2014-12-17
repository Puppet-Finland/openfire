#
# == Class: openfire::params
#
# Defines some variables based on the operating system
#
class openfire::params {

    case $::osfamily {
        'RedHat': {
            $basedir = '/opt'
            $install_dir = "$basedir/openfire"
            $package_baseurl = 'http://download.igniterealtime.org/openfire'
            $package_name = 'openfire-3.9.3-1.i386.rpm'
            $service_name = 'openfire'
            $service_start = "/sbin/service $service_name start"
            $service_stop = "/sbin/service $service_name stop"
            $pidfile = '/var/run/openfire.pid'
        }
        'Debian': {
            $basedir = '/usr/share/'
            $install_dir = "$basedir/openfire"
            $package_baseurl = 'http://download.igniterealtime.org/openfire'
            $package_name = 'openfire_3.9.3_all.deb'
            $service_name = 'openfire'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
            $pidfile = '/var/run/openfire.pid'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
