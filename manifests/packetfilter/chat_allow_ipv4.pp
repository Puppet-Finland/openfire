#
# == Define: openfire::packetfilter::chat_allow_ipv4
#
# These rules affect inbound connection from chat clients.
#
define openfire::packetfilter::chat_allow_ipv4 {

    $source_v4 = $title ? {
        'any'   => undef,
        default => $title,
    }

    firewall { "012 ipv4 accept openfire chat clients from ${title}":
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 5222,
        action   => 'accept',
    }

    firewall { "012 ipv4 accept openfire chat clients over SSL from ${title}":
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 5223,
        action   => 'accept',
    }
}
