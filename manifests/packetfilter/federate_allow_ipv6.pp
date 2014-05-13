#
# == Define: openfire::packetfilter::federate_allow_ipv6
#
# These rules affect the XMPP federation services.
#
define openfire::packetfilter::federate_allow_ipv6 {

    firewall { "012 ipv6 accept openfire federation from ${title}":
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $title ? {
            'any' => undef,
            default => $title,
        },
        dport => 5269,
        action => 'accept',
    }
}
