class cervidae::profiles::firewall::init
{
    if "${::server_type}" != ""
    {
        include "cervidae::profiles::firewall::${::server_type}"
    }
    include cervidae::profiles::firewall::default
}
