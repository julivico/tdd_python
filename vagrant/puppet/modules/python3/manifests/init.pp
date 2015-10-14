# Class: python3
#
#
class python3 {
   # resources

    package { ['python3', 'python3-pip']:
        ensure => present,
        require => Class["system-update"],
    }


}