#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "mkdir -p /data/home;"
	
    echo END $node

done < nodes
