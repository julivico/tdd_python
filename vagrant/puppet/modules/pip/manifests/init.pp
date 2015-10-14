# Class: name
#
#
class pip {
    # resources

    exec { 'pip3-installation':
        command      => 'pip3 install virtualenv',
        require => Class['python3'],
    }
}