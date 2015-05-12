#
# == Define: openfire::packetfilter::filetransfer_allow_ipv4
#
# These rules affect the XMPP file transfer proxy.
#
define openfire::packetfilter::filetransfer_allow_ipv4 {

    $source_v4 = $title ? {
        'any'   => undef,
        default => $title,
    }

    firewall { "012 ipv4 accept openfire file transfer from ${title}":
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 7777,
        action   => 'accept',
    }
}
