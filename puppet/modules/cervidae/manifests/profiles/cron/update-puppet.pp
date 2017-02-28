#
# A simple class for managing the puppet update script
#
class fnc_core::profiles::cron::update-puppet
  {
    file { '/usr/bin/update-puppet.sh':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0700',
      source => 'puppet:///modules/cervidae/cron/update-puppet.sh',
    }

    cron::job { 'update-puppet':
      minute      => '*/15',
      hour        => '*',
      date        => '*',
      month       => '*',
      weekday     => '*',
      user        => 'root',
      command     => '/usr/bin/update-puppet.sh',
      environment => [ 'PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/aws/bin:/root/bin"', ],
      description => 'Run puppet update',
    }
  }

