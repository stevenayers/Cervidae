#
# A simple class for managing a user
#
class cervidae::profiles::users::cervidae {

  accounts::user { 'kibana':
    ensure        => present,
    password      => '!!',
    comment       => 'Kibana Service Account',
    purge_sshkeys => true,
    managehome    => true,
  }

}