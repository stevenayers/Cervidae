class cervidae::roles::kibana {
  $server_type = hiera('classes')

  notice("Beginning Elasticsearch installation on ${::fqdn}.")
  include cervidae::profiles::kibana::init
}