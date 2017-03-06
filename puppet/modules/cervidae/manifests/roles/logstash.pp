class cervidae::roles::logstash {
  $server_type = hiera('classes')

  notice("Installed started on ${::fqdn} as class ${::server_type}.")
  include cervidae::profiles::logstash::init
}