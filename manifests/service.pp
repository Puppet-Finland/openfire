#
# == Class: openfire::service
#
# Ensure OpenFire starts on boot
#
class openfire::service inherits openfire::params {

    service { 'openfire':
        name      => $::openfire::params::service_name,
        enable    => true,
        hasstatus => false,
        require   => Class['openfire::install'],
    }
}
