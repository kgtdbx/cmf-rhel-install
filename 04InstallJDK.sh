#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
     echo begin | ssh $LOGIN@$node "yum -y install oracle-j2sdk1.7; exit"
 
    echo END $node

done < nodes
