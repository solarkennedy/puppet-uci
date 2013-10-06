uci

[![Build Status](https://travis-ci.org/solarkennedy/puppet-uci.png)](https://travis-ci.org/solarkennedy/puppet-uci)

This is the uci module.
It sets up defines to make it easier to manage anything you would normally
set using the "uci" command in OpenWrt.

Installation
-----------
    puppet module install KyleAnderson/uci

Examples
-------
Anything that you would use uci to set you can use with this module:

    uci { 'system.@system[0].hostname': value => $fqdn }
    uci { 'wireless.@wifi-iface[0].ssid': value => 'Scan My Network and Die' }
    uci { 'dropbear.@dropbear[0].PasswordAuth": value => 'on' }

Don't you wish everything used UCI? :)

License
-------
Apache 2.0

Contact
-------
Kyle Anderson <kyle@xkyle.com>

Support
-------
Please log tickets and issues at our [Projects site](https://github.com/solarkennedy/puppet-uci)
