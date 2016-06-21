#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "sysctl vm.swappiness=10; exit;"
	
    echo END $node

done < nodes
