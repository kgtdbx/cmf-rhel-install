#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
#      ssh root@$node "wget http://repo.mysql.com//mysql57-community-release-el6-7.noarch.rpm;exit;"
      ssh root@$node "yum -y install mysql57-community-release-el6-7.noarch.rpm;exit;"
      ssh root@$node "yum-config-manager --disable mysql57-community;exit;"
      ssh root@$node "yum-config-manager --enable mysql56-community;exit;"
      ssh root@$node "yum -y install mysql-community-server;exit;"
      ssh root@$node "chkconfig --add mysqld; service mysqld stop; exit;"
	
      scp primary-my.cnf root@$node:/etc/my.cnf
	
      ssh root@$node "service mysqld start;exit;"
      ssh root@$node "/usr/bin/mysqladmin -u root password 'cloudera';exit;"
	
   echo END $node

done < nodes
