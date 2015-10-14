

Exec { path => ["/bin/", "/sbin/", "/usr/bin", "usr/sbin/"]}


include stdlib
include htop
include nginx
include python3
include init_directories
include pip
include virtualenv
include git
include django
include system-update