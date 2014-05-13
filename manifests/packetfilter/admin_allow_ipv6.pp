#
# == Define: openfire::packetfilter::admin_allow_ipv6
#
# These rules affect connections to OpenFire admin ui.
#
define openfire::packetfilter::admin_allow_ipv6 {

    firewall { "012 ipv6 accept openfire admin ui from ${title}":
        provider => 'ip6tables',
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
