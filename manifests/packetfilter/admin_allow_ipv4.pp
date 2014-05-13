#
# == Define: openfire::packetfilter::admin_allow_ipv4
#
# These rules affect connections to OpenFire admin ui.
#
define openfire::packetfilter::admin_allow_ipv4 {

    firewall { "012 ipv4 accept openfire admin ui from ${title}":
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $title ? {
            'any' => undef,
            default => $title,
        },
        dport => 9090,
        action => 'accept',
    }
}
