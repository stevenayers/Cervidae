class cervidae::roles::kibana {
  $server_type = hiera('classes')

  notice("Installed started on ${::fqdn} as class ${::server_type}.")
  include cervidae::profiles::kibana::init
}