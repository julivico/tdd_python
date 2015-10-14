# Class: name
#
#
class git {
    # resources

    package { 'git':
        ensure => installed,
        require => Class['system-update'],
    }


    exec { 'clone_repo_from github':
        command      => ['git clone "https://github.com/julivico/tdd_python.git" source'],
        cwd => '/home/vagrant/sites/tdd_python/',
        require => [Class['init_directories'], Package['git']],
        #path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        #refreshonly => true,
    }

    
}

