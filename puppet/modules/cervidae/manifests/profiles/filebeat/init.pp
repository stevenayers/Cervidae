class cervidae::profiles::filebeat::init
  {
    filebeat { 'default':
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
