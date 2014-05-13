#
# == Class: openfire::monit
#
# Setups monit rules for openfire
#
class openfire::monit
(
    $monitor_email
)
{
    monit::fragment { 'openfire-openfire.monit':
        modulename => 'openfire',
    }
}
