#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
   cat id_rsa.pub | ssh root@$node 'dd of=.ssh/authorized_keys oflag=append conv=notrunc'
  
    echo END $node

done < nodes
