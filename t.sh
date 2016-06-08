#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      ssh $LOGIN@$node "[ -f /etc/yum.repos.d/cloudera-manager.repo ] && echo "File exist" || echo "File does not exist""
 
    echo END $node

done < nodes
