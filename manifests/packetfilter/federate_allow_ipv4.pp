#
# == Define: openfire::packetfilter::federate_allow_ipv4
#
# These rules affect the XMPP federation services.
#
define openfire::packetfilter::federate_allow_ipv4 {

    firewall { "012 ipv4 accept openfire federation from ${title}":
        provider => 'iptables',
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
