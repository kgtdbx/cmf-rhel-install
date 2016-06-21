#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
     echo begin | ssh $LOGIN@$node "yum -y install cloudera-manager-server cloudera-manager-daemons; exit"
 
    echo END $node

done < nodes
