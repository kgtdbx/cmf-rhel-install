#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "yum -y remove mysql-community*;rm -R -f /var/lib/mysql; exit"
	
	
    echo END $node

done < nodes
