#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
      echo begin | ssh root@$node "chgrp -R cloudera-scm /data"
      echo begin | ssh root@$node "chmod -R 775 /data" 
      echo begin | ssh root@$node "mkdir -p /data/cloudera/csd"
      echo begin | ssh root@$node "mkdir -p /data/cloudera/parcel-repo"
    echo END $node

done < nodes
