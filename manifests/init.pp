# == Define: uci
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Kyle Anderson <kyle@xkyle.com>
#
# === Copyright
#
# Copyright 2013 Kyle Anderson, unless otherwise noted.
#

define uci($value){
  exec { "/sbin/uci set ${name} ${value}":
    unless => "/sbin/uci get ${name} | grep ^${value}$",
    notify => Exec['/sbin/uci commit']
  }
}

# Should be run after any "sets" happen via notify
exec { '/sbin/uci commit': }


