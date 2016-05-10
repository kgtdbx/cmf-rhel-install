#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
      ssh root@$node "/usr/share/cmf/schema/scm_prepare_database.sh mysql cm cm cm ; exit"
      ssh root@$node "service cloudera-scm-server start"
      ssh root@$node "tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log" 

   echo END $node

done < nodes
