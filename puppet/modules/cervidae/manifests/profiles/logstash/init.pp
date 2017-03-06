class cervidae::profiles::logstash::init
{
    class { 'logstash':
      manage_repo  => true,
      java_install => true,
    }

    # It is essential to provide a valid Logstash configuration file for the daemon to start.
    logstash::configfile { 'my_ls_config':
      content => template('path/to/config.file'),
    }
}
