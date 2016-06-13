# zabbix_messagebird
Module to send SMS messages from Zabbix using Messagebird

This module follows the example given on https://www.zabbix.com/documentation/3.2/manual/config/notifications/media/script

It can also be executed from the command line by calling it like:

```
perl sendsms.pl <comma separated list of MSISDNs> <sender> <message> <Messagebird REST API key>
```

Example:

```
perl sendsms.pl 31612345678,31698765432 Zabbix "Test alert" <Messagebird REST API key>
```
