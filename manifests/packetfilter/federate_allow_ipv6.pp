#
# == Define: openfire::packetfilter::federate_allow_ipv6
#
# These rules affect the XMPP federation services.
#
define openfire::packetfilter::federate_allow_ipv6 {

    $source_v6 = $title ? {
        'any'   => undef,
        default => $title,
    }

    @firewall { "012 ipv6 accept openfire federation from ${title}":
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v6,
        dport    => 5269,
        action   => 'accept',
        tag      => 'default',
    }
}
