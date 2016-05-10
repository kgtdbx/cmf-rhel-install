#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
      scp db.sql root@$node:db.sql
      ssh root@$node "mysql -u root --password='cloudera' <  db.sql  ;exit;"
	
   echo END $node

done < nodes
