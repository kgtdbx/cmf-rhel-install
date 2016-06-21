#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
    echo begin | ssh $LOGIN@$node "yum install -y git gcc; exit;"
    echo begin | ssh $LOGIN@$node "git clone https://github.com/cloudera/impyla.git /data/home/cloudera"
    echo begin | ssh $LOGIN@$node "cd /data/home/cloudera/impyla;python setup.py install"
    echo begin | ssh $LOGIN@$node "chown -R cloudera:hive /data/home/cloudera"
	
    echo END $node

done < nodes
