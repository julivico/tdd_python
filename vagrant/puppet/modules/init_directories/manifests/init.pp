# Class: name
#
#
class init_directories {
    # resources
    exec { 'mkdir_sites':
        command      => ['mkdir -p /home/vagrant/sites/tdd_python'],
        #cwd => '/home/vagrant/',
        #path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        #refreshonly => true,
    }

    exec { 'mkdir_directories':
        command      => ['mkdir databases source static virtualenv'],
        cwd => '/home/vagrant/sites/tdd_python/',
        require => Exec['mkdir_sites'],
        #path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        #refreshonly => true,
    }
}