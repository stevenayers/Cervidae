class cervidae::profiles::firewall::init
{
    package { 'firewalld':
        name     => 'firewalld',
        provider => 'yum',
        ensure   => 'present',
    }

    if $::server_type != ""
    {
        include "cervidae::profiles::firewall::${::server_type}"
    }
    include cervidae::profiles::firewall::default
}
