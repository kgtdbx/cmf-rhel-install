#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      scp db.sql $LOGIN@$node:db.sql
      ssh $LOGIN@$node "mysql -u root --password='cloudera' <  db.sql  ;exit;"
	
   echo END $node

done < nodes
