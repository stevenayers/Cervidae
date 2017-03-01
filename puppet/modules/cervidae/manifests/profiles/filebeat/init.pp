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
  }
