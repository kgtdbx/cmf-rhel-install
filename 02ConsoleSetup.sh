#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here

      scp motc root@$node:/etc/motc
      scp purpose root@$node:/etc/purpose
      scp setconsole root@$node:/etc/init.d/setconsole
      ssh root@$node "chkconfig --add setconsole; service setconsole start"
 
    echo END $node

done < nodes
