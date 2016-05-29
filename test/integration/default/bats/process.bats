#!/usr/bin/env bats

setup() {
    apt-get install -y curl >/dev/null || yum -y install curl >/dev/null
}

@test "process mysqld should be running" {
    run pgrep mysqld
    [ "$status" -eq 0 ]
    [[ "$output" != "" ]]
}

#@test "process apache2/httpd should be running" {
#    run pgrep apache2 || pgrep httpd
#    [ "$status" -eq 0 ]
#    [[ "$output" != "" ]]
#}

@test "process icinga2 should be running" {
    run pgrep icinga2
    [ "$status" -eq 0 ]
    [[ "$output" != "" ]]
}

@test "icingacli should return no error" {
    run icingacli monitoring list
    [ "$status" -eq 0 ]
## centos71: returns nothing, ubuntu1404 has contents for localhost
#    [[ "$output" != "" ]]
}

@test "Icingaweb2 login url should be accessible" {
    run curl -sSqL http://localhost/icingaweb2/ -b /tmp/cookie
    [ "$status" -eq 0 ]
    [[ "$output" =~ "<title>Icinga Web 2 Login</title>" ]]
}

#@test "process rrdcached should be running (pnp4nagios) - not on redhat" {
#    run pgrep rrdcached || test -f /etc/redhat-release
#    [ "$status" -eq 0 ]
#    [[ "$output" != "" ]]
#}

@test "Pnp4nagios url should be accessible" {
    run curl -sSqL http://localhost/pnp4nagios/
    [ "$status" -eq 0 ]
    [[ "$output" =~ "<!DOCTYPE html PUBLIC" ]]
}

@test "Nagvis url should be accessible" {
    run curl -sSqL http://localhost/nagvis/
    [ "$status" -eq 0 ]
    [[ "$output" =~ "<title>NagVis " ]]
}



