#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
#	scp primary-my.cnf root@$node:/etc/my.cnf
	
#	ssh root@$node "service mysqld start;

#        ssh root@$node  "/usr/bin/mysqladmin -u root password 'cloudera';"
        ssh root@$node  "/usr/bin/mysqladmin -u root -h localhost.localdomain password 'cloudera'"
	
        ssh root@$node "mysqladmin --user root --password 'cloudera'"	
    echo END $node

done < nodes
