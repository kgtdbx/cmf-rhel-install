#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
     ssh root@$node "yum -y install cloudera-manager-server cloudera-manager-daemons; exit"
 
    echo END $node

done < nodes
