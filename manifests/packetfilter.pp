#
# == Class: openfire::packetfilter
#
# A class for managing packet filtering rules for OpenFire XMPP/Chat servers.
#
class openfire::packetfilter
(
    $chat_allow_addresses_ipv4,
    $chat_allow_addresses_ipv6,
    $federate_allow_addresses_ipv4,
    $federate_allow_addresses_ipv6,
    $admin_allow_addresses_ipv4,
    $admin_allow_addresses_ipv6
)
{
    # Client connections
    openfire::packetfilter::chat_allow_ipv4 { $chat_allow_addresses_ipv4: }
    openfire::packetfilter::chat_allow_ipv6 { $chat_allow_addresses_ipv6: }

    # Federation (i.e. communication with other XMPP services)
    openfire::packetfilter::federate_allow_ipv4 { $federate_allow_addresses_ipv4: }
    openfire::packetfilter::federate_allow_ipv6 { $federate_allow_addresses_ipv6: }

    # Connections to the admin interface
    openfire::packetfilter::admin_allow_ipv4 { $admin_allow_addresses_ipv4: }
    openfire::packetfilter::admin_allow_ipv6 { $admin_allow_addresses_ipv6: }
}
