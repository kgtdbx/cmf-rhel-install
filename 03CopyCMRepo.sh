#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      ssh $LOGIN@$node "[ -f /etc/yum.repos.d/cloudera-manager.repo ] && echo "File exist" || echo "File does not exist""
      ssh $LOGIN@$node "cd /etc/yum.repos.d/;wget http://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo; yum repolist"
 
    echo END $node

done < nodes
