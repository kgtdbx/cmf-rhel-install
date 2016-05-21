#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here

      scp motc $LOGIN@$node:/etc/motc
      scp purpose $LOGIN@$node:/etc/purpose
      scp setconsole $LOGIN@$node:/etc/init.d/setconsole
      ssh $LOGIN@$node "chkconfig --add setconsole; service setconsole start"
 
    echo END $node

done < nodes
