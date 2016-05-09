#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
    ssh root@$node "wget http://repo.mysql.com//mysql57-community-release-el6-7.noarch.rpm; yum -y install mysql57-community-release-el6-7.noarch.rpm; yum-config-manager --disable mysql57-community; yum-config-manager --enable mysql56-community; yum -y install mysql-community-server; chkconfig --add mysqld; service mysqld stop; exit"
	
	scp root@$node primary-my.cnf /etc/my.cnf
	
	ssh root@$node "service mysqld start"
	
	
    echo END $node

done < nodes
