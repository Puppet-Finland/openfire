#
# == Class: openfire::monit
#
# Setups monit rules for openfire
#
class openfire::monit
(
    $monitor_email

) inherits openfire::params
{
    monit::fragment { 'openfire-openfire.monit':
        basename   => 'openfire',
        modulename => 'openfire',
    }
}
