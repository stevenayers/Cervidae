class cervidae::profiles::firewall::kibana {
  firewall { '007 Allow inbound HTTP (80)':
    dport   => 80,
    proto   => tcp,
    action  => accept,
  }
  firewall { '008 Allow inbound HTTPS (443)':
    dport   => 443,
    proto   => tcp,
    action  => accept,
  }
}