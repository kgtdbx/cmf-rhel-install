#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
      
     ssh root@$node "yum -y install oracle-j2sdk1.7; exit"
 
    echo END $node

done < nodes
