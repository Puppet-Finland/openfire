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
# == Parameters
#
# [*manage*]
#   Manage OpenFire using Puppet. Valid values are true (default) and false.
# [*manage_packetfilter*]
#   Manage packet filtering rules. Valid values are true (default) and false.
# [*chat_allow_addresses_ipv4*]
#   An array of IPv4 addresses from which to allow client-to-server connections to port 
#   5222. Defaults to ['127.0.0.1']. 
# [*chat_allow_addresses_ipv6*]
#   Same as above but for IPv6. Defaults to ['::1'].
# [*federate_allow_addresses_ipv4*]
#   Same as above for IPv4 server-to-server (federation) traffic.
# [*federate_allow_addresses_ipv6*]
#   Same as above for IPv6 server-to-server (federation) traffic.
# [*filetransfer_allow_addresses_ipv4*]
#   Same as above for IPv4 file transfer proxy traffic.
# [*filetransfer_allow_addresses_ipv6*]
#   Same as above for IPv6 file transfer proxy traffic.
# [*admin_allow_addresses_ipv4*]
#   An array of IPv4 addresses from which to allow connections to the OpenFire 
#   administration interface. Defaults to ['127.0.0.1'].
# [*admin_allow_addresses_ipv6*]
#   Same as above but for IPv6. Defaults to ['::1'].
# [*monitor_email*]
#   Email address where local service monitoring software sends it's reports to.
#   Defaults to top scope variable $::servermonitor.
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class openfire
(
    Boolean $manage = true,
    Boolean $manage_packetfilter = true,
            $chat_allow_addresses_ipv4 = ['127.0.0.1'],
            $chat_allow_addresses_ipv6 = ['::1'],
            $federate_allow_addresses_ipv4 = ['127.0.0.1'],
            $federate_allow_addresses_ipv6 = ['::1'],
            $filetransfer_allow_addresses_ipv4 = ['127.0.0.1'],
            $filetransfer_allow_addresses_ipv6 = ['::1'],
            $admin_allow_addresses_ipv4 = ['127.0.0.1'],
            $admin_allow_addresses_ipv6 = ['::1'],
            $monitor_email = $::servermonitor

) inherits openfire::params
{

if $manage {

    include ::openfire::install

    include ::openfire::service

    if $manage_packetfilter {
        class { '::openfire::packetfilter':
            chat_allow_addresses_ipv4         => $chat_allow_addresses_ipv4,
            chat_allow_addresses_ipv6         => $chat_allow_addresses_ipv6,
            federate_allow_addresses_ipv4     => $federate_allow_addresses_ipv4,
            federate_allow_addresses_ipv6     => $federate_allow_addresses_ipv6,
            filetransfer_allow_addresses_ipv4 => $filetransfer_allow_addresses_ipv4,
            filetransfer_allow_addresses_ipv6 => $filetransfer_allow_addresses_ipv6,
            admin_allow_addresses_ipv4        => $admin_allow_addresses_ipv4,
            admin_allow_addresses_ipv6        => $admin_allow_addresses_ipv6,
        }
    }

    if tagged('monit') {
        class { '::openfire::monit':
            monitor_email => $monitor_email,
        }
    }
}
}
