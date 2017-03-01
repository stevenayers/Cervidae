class cervidae::roles::default {
  $server_type = hiera('classes', 'fnc_core::roles::default')
  notice("Install started on ${::fqdn} as class ${::server_type}.")

  include cervidae::profiles::users::init
  include cervidae::profiles::groups::init
  include cervidae::profiles::firewall::init
  include cervidae::profiles::filebeat::init

}
