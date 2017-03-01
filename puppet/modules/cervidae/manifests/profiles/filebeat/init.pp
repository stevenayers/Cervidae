class cervidae::profiles::filebeat::init
  {
    class { 'filebeat':
      outputs => {
        'logstash' => {
          'hosts' => [
            'localhost:5044',
            'anotherserver:5044'
          ],
          'loadbalance' => true,
        },
      },
    }

    filebeat::prospector { 'syslogs':
      paths    => [
        '/var/log/auth.log',
        '/var/log/syslog',
      ],
      doc_type => 'syslog-beat',
    }
  }
