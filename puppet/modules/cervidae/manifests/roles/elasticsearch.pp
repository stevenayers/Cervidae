class cervidae::roles::elasticsearch {
  $server_type = hiera('classes')

  notice("Installed started on ${::fqdn} as class ${::server_type}.")

}