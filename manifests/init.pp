# == Define: uci
#
# === Parameters
#  $name  = The thing you are setting
#  $value = The value you are trying to set
#
# === Examples
#
#    uci { 'system.@system[0].hostname': value => $fqdn }
#    uci { 'wireless.@wifi-iface[0].ssid': value => 'Scan My Network and Die' }
#    uci { 'dropbear.@dropbear[0].PasswordAuth": value => 'on' }
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
  exec { "/sbin/uci set ${name}=${value}":
    unless => "/sbin/uci get ${name} | grep ^${value}$",
    notify => Exec['/sbin/uci commit']
  }

  # Should be run after any "sets" happen via notify
  if ! defined(Exec['/sbin/uci commit']){
    exec { '/sbin/uci commit': }
  }
}
