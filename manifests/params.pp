#
# == Class: openfire::params
#
# Defines some variables based on the operating system
#
class openfire::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'openfire'
            $service_name = 'openfire'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
            $pidfile = '/var/run/openfire.pid'
        }
        default: {
            $package_name = 'openfire'
            $service_name = 'openfire'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
            $pidfile = '/var/run/openfire.pid'
        }
    }
}
