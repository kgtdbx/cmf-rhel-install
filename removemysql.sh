#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
    ssh root@$node "yum -y remove mysql-community*;rm -R -f /var/lib/mysql; exit"
	
	
    echo END $node

done < nodes
