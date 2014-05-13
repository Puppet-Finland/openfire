#
# == Define: openfire::packetfilter::chat_allow_ipv4
#
# These rules affect inbound connection from chat clients.
#
define openfire::packetfilter::chat_allow_ipv4 {

    firewall { "012 ipv4 accept openfire chat clients from ${title}":
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $title ? {
            'any' => undef,
            default => $title,
        },
        dport => 5222,
        action => 'accept',
    }
}
