class cervidae::roles::kibana {
  $server_type = hiera('classes')

  notice("Beginning Kibana installation on ${::fqdn}.")
  include cervidae::profiles::kibana::init
}