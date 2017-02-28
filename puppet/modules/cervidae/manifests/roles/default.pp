class cervidae::roles::default {
  $server_type = hiera('classes', 'fnc_core::roles::default')

  notice("Install started on ${::fqdn} as class ${::server_type}.")

  include cervidae::profiles::users
  include cervidae::profiles::groups


}
