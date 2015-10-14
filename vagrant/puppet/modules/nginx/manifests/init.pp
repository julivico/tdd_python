class nginx 
{

    package { "nginx":
        ensure  => present,
        require => Class["system-update"],
    }

    service { "nginx":
        ensure  => running,
        require => Package["nginx"],
    }

    # add vhost template
    file { 'vagrant-nginx':
        path => '/etc/nginx/sites-available/nginx_tdd_conf',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/nginx_tdd_conf',
    }


    # disable the default nginx vhost
    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    # Symlink out vhost in sites-enabled to enable it
    file { 'nginx-django-enable':
        path => '/etc/nginx/sites-enabled/nginx_tdd_conf',
        target => '/etc/nginx/sites-available/nginx_tdd_conf',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vagrant-nginx'], 
            File['default-nginx-disable'],
        ],
    }
}