#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "resize2fs -p /dev/xvde1; exit;"
	
    echo END $node

done < nodes
