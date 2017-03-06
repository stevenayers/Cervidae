class cervidae::roles::elasticsearch {
  $server_type = hiera('classes')

  notice("Beginning Elasticsearch installation on ${::fqdn}.")
  include cervidae::profiles::elasticsearch::init
}