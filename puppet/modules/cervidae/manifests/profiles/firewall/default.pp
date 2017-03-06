class cervidae::profiles::firewall::default
  {
    notice("Running default firewall configurations for $server_type.")

    firewall { '001 Allow inbound HTTP (22)':
      dport   => 22,
      proto   => tcp,
      action  => accept,
    }

  }
