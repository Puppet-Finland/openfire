#
# == Define: openfire::packetfilter::admin_allow_ipv4
#
# These rules affect connections to OpenFire admin ui.
#
define openfire::packetfilter::admin_allow_ipv4 {

    $source_v4 = $title ? {
        'any'   => undef,
        default => $title,
    }

    firewall { "012 ipv4 accept openfire admin ui from ${title}":
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 9090,
        action   => 'accept',
    }
}
