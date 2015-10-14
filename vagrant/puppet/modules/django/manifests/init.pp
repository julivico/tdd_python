include stdlib

# Class: name
#
#
class django {
    # resources

    exec { 'collectstatic':
        command      => '/home/vagrant/sites/tdd_python/virtualenv/bin/python3 manage.py collectstatic --noinput',
        cwd => '/home/vagrant/sites/tdd_python/source',
        require => [Class['virtualenv'], Class['git']],
    }

    exec { 'makemigrations':
        command      => '/home/vagrant/sites/tdd_python/virtualenv/bin/python3 manage.py makemigrations',
        cwd => '/home/vagrant/sites/tdd_python/source',
        require => [Class['virtualenv'], Exec['collectstatic']],
    }

    exec { 'migrate_db':
        command      => '/home/vagrant/sites/tdd_python/virtualenv/bin/python3 manage.py migrate',
        cwd => '/home/vagrant/sites/tdd_python/source',
        require => [Class['virtualenv'], Exec['makemigrations']],
    }

    file_line { 'disable_debug':
        path  => '/home/vagrant/sites/tdd_python/source/superlists/settings.py',
        line  => 'DEBUG = False',
        match => 'DEBUG =*',
        require => Exec['migrate_db'],
    }


    file_line { 'add_allowed_hosts':
        path  => '/home/vagrant/sites/tdd_python/source/superlists/settings.py',
        line  => 'ALLOWED_HOSTS = [\'10.0.3.22\']',
        match => 'ALLOWED_HOSTS =*',
        require => Exec['migrate_db'],
    }
    
}