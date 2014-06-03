#
# == Define: openfire::packetfilter::filetransfer_allow_ipv6
#
# These rules affect the XMPP file transfer proxy.
#
define openfire::packetfilter::filetransfer_allow_ipv6 {

    firewall { "012 ipv6 accept openfire file transfer from ${title}":
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $title ? {
            'any' => undef,
            default => $title,
        },
        dport => 7777,
        action => 'accept',
    }
}
