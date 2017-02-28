class cervidae::roles::default {
  $server_type = hiera('classes', 'fnc_core::roles::default')

  notice("Installed started on ${::fqdn} as class ${server_type}.")

}
