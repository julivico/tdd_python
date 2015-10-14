# Class: name
#
#
class virtualenv {
    # resources

    exec { 'create_virtualenv':
        command      => ['virtualenv --python=python3 virtualenv'],
        cwd => '/home/vagrant/sites/tdd_python',
        path => ['/usr/local/bin', '/usr/bin'],
        require => [Class['init_directories'], Class['pip'], Class['python3']],
        #path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        #refreshonly => true,
    }

    exec { 'pip_for_virtualenv':
        command      => '/home/vagrant/sites/tdd_python/virtualenv/bin/pip3 install django gunicorn',
        require => Exec['create_virtualenv'],
        #path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        #refreshonly => true,
    }

}