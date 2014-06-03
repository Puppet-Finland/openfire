#
# == Define: openfire::packetfilter::filetransfer_allow_ipv4
#
# These rules affect the XMPP file transfer proxy.
#
define openfire::packetfilter::filetransfer_allow_ipv4 {

    firewall { "012 ipv4 accept openfire file transfer from ${title}":
        provider => 'iptables',
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
