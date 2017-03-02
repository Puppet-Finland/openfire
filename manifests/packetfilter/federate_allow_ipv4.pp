#
# == Define: openfire::packetfilter::federate_allow_ipv4
#
# These rules affect the XMPP federation services.
#
define openfire::packetfilter::federate_allow_ipv4 {

    $source_v4 = $title ? {
        'any'   => undef,
        default => $title,
    }

    @firewall { "012 ipv4 accept openfire federation from ${title}":
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 5269,
        action   => 'accept',
        tag      => 'default',
    }
}
