$TTL 60
$ORIGIN mydomain.com
@           IN  SOA  mydomain.com. admin.mydomain.com. (
                     2017071600 ; Serial
                     4H         ; Refresh
                     1H         ; Retry
                     7D         ; Expire
                     4H )       ; Negative Cache TTL


@           IN  A    127.0.0.1

*.mydomain.com. IN  A    127.0.0.2

foo         IN  A    127.0.0.3
