class cervidae::profiles::firewall::init
{
    include "cervidae::profiles::firewall::${::server_type}"
}
