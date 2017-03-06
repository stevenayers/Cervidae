class cervidae::profiles::kibana::init
{
  class { 'kibana4':
    config => {
      'server.port'                  => 5601,
      'server.host'                  => '0.0.0.0',
      'elasticsearch.url'            => 'http://elasticsearch.cervidae.internal:9200',
      #'elasticsearch.preserveHost'   => true,
      #'elasticsearch.ssl.cert'       => '/path/to/your/cert',
      #'elasticsearch.ssl.key'        => '/path/to/your/key',
      #'elasticsearch.password'       => 'password',
      #'elasticsearch.username'       => 'username',
      #'elasticsearch.pingTimeout'    => 1500,
      #'elasticsearch.startupTimeout' => 5000,
      'kibana.index'                 => '.kibana',
      'kibana.defaultAppId'          => 'discover',
      'logging.silent'               => false,
      'logging.quiet'                => false,
      'logging.verbose'              => false,
      'logging.events'               => "{ log: ['info', 'warning', 'error', 'fatal'], response: '*', error: '*' }",
      'elasticsearch.requestTimeout' => 500000,
      'elasticsearch.shardTimeout'   => 0,
      #'elasticsearch.ssl.verify'     => true,
      #'elasticsearch.ssl.ca'         => '[/path/to/a/CA,path/to/anotherCA/]',
      #'server.ssl.key'               => '/path/to/your/ssl/key',
      #'server.ssl.cert'              => '/path/to/your/ssl/cert',
      'pid.file'                     => '/var/run/kibana/kibana.pid',
      'logging.dest'                 => '/var/log/kibana/kibana.log',
    },
  }
}
