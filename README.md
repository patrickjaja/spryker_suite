Latest spryker suite (official release 202009) announced on 09.09.2020 11:00 am provided in a minimal fast setup.
 - No complexity in setup
 - Fast and stable
 - No abstraction, native docker cli usage in development
 
Installation Notes [install docs](docker/README.md)

#### Services (for service versions check [install docs](docker/docker-compose.yml)
###### PHP
http://de.www.suite.local <br/> bill.martin@spryker.com/change123

http://de.zed.suite.local <br/> admin@spryker.com/change123

http://de.glue.suite.local <br/> bill.martin@spryker.com/change123

###### Jenkins
http://localhost:9090

###### RabbitMQ
http://localhost:15672
spryker/mate20mg

###### Postgres
jdbc:postgresql://localhost:5432/postgres
spryker/mate20mg

###### docker stats (disabled jenkins)
![](assets/local_setup.png)


# podman notes

sysctl net.ipv4.ip_unprivileged_port_start=0
sysctl -w net.ipv4.ip_unprivileged_port_start=0

sudo usermod --add-subuids 200000-201000 --add-subgids 200000-201000 patrickjaja

root@30f5de311efa:/data/shop/development/current# cat /etc/subuid
nexus:100000:65536
