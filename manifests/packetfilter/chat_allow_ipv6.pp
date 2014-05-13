#
# == Define: openfire::packetfilter::chat_allow_ipv6
#
# These rules affect inbound connection from chat clients.
#
define openfire::packetfilter::chat_allow_ipv6 {

    firewall { "012 ipv6 accept openfire chat clients from ${title}":
        provider => 'ip6tables',
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
