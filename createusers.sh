#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "useradd --home-dir /data/home/cloudera -u 4200 -g 100 cloudera;"
	
    echo END $node

done < nodes
