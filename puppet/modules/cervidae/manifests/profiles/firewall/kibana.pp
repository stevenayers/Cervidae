class cervidae::profiles::firewall::kibana {

  notice("Running kibana firewall configurations for ${::server_type}.")

  firewall { '101 Allow inbound HTTP (5601)':
    dport   => 5601,
    proto   => tcp,
    action  => accept
  }

}