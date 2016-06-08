#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      echo begin| ssh $LOGIN@$node "wget http://repo.mysql.com//mysql57-community-release-el6-7.noarch.rpm;exit;"
      echo begin| ssh $LOGIN@$node "yum -y install mysql57-community-release-el6-7.noarch.rpm;exit;"
      echo begin| ssh $LOGIN@$node "yum-config-manager --disable mysql57-community;exit;"
      echo begin| ssh $LOGIN@$node "yum-config-manager --enable mysql56-community;exit;"
      echo begin| ssh $LOGIN@$node "yum -y install mysql-community-server;exit;"
      echo begin| ssh $LOGIN@$node "chkconfig --add mysqld; service mysqld stop; exit;"
	
      scp primary-my.cnf $LOGIN@$node:/etc/my.cnf
	
      echo begin| ssh $LOGIN@$node "service mysqld start;exit;"
      echo begin| ssh $LOGIN@$node "/usr/bin/mysqladmin -u root password 'cloudera';exit;"
	
   echo END $node

done < nodes
