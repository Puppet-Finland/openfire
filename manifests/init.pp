#
# == Class: openfire
#
# A class for managing OpenFire XMPP/Chat servers.
#
# Currently this class only manages the service, packet filtering and local 
# monitoring using monit. The preceeding steps (install and configure) have not 
# been implemented yet. Note that you should apply this class _after_ OpenFire 
# is setup, or monit will start complaining loudly.
#
class openfire
(
    $chat_allow_addresses_ipv4 = ['127.0.0.1'],
    $chat_allow_addresses_ipv6 = ['::1'],
    $federate_allow_addresses_ipv4 = ['127.0.0.1'],
    $federate_allow_addresses_ipv6 = ['::1'],
    $admin_allow_addresses_ipv4 = ['127.0.0.1'],
    $admin_allow_addresses_ipv6 = ['::1'],
    $monitor_email = $::servermonitor
)
{

    # This is currently an empty class
    include openfire::install

    include openfire::service

    if tagged('packetfilter') {
        class { 'openfire::packetfilter':
            chat_allow_addresses_ipv4 => $chat_allow_addresses_ipv4,
            chat_allow_addresses_ipv6 => $chat_allow_addresses_ipv6,
            federate_allow_addresses_ipv4 => $federate_allow_addresses_ipv4,
            federate_allow_addresses_ipv6 => $federate_allow_addresses_ipv6,
            admin_allow_addresses_ipv4 => $admin_allow_addresses_ipv4,
            admin_allow_addresses_ipv6 => $admin_allow_addresses_ipv6,
        }
    }

    if tagged('monit') {
        class { 'openfire::monit':
            monitor_email => $monitor_email,
        }
    }
}

