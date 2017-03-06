class cervidae::profiles::elasticsearch::init
{
  class { 'elasticsearch':
    java_install => true,
    manage_repo  => true,
    repo_version => '5.x',
  }

  elasticsearch::instance { 'es-01': }
}
