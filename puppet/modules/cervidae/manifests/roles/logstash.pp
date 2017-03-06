class cervidae::roles::logstash {
  $server_type = hiera('classes')

  notice("Beginning Logstash installation on ${::fqdn}.")
  include cervidae::profiles::logstash::init
}