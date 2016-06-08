#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here

      echo begin scp motc $LOGIN@$node:/etc/motc
      echo begin scp purpose $LOGIN@$node:/etc/purpose
      echo begin |scp setconsole $LOGIN@$node:/etc/init.d/setconsole
      echo begin | ssh $LOGIN@$node "chkconfig --add setconsole; service setconsole start"
 
    echo END $node

done < nodes
