#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      echo begin | ssh $LOGIN@$node "/usr/share/cmf/schema/scm_prepare_database.sh mysql cm cm cm ; exit"
      echo begin | ssh $LOGIN@$node "service cloudera-scm-server start"
      echo begin | ssh $LOGIN@$node "tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log" 

   echo END $node

done < nodes
