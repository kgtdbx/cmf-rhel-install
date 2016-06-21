#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "reboot; exit;"
	
    echo END $node

done < nodes
