class htop
{

    package { "htop":
        ensure  => present,
        require => Class["system-update"],
    }


    package { "tree":
        ensure  => present,
        require => Class["system-update"],
    }
}