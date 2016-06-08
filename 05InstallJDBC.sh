#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
       echo begin | ssh $LOGIN@$node "mkdir /usr/share/java ;wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.38.tar.gz;tar -xvf *.gz ; cp ./mysql-connector-java-5.1.38/mysql-connector-java-5.1.38-bin.jar /usr/share/java/mysql-connector-java.jar;exit;"
 


#       echo begin | ssh $LOGIN@$node "mkdir /usr/share/java; wget http://192.168.42.102/yum/repo/jdbc/mysql-connector-java-5.1.38.tar.gz; tar -xvf *.gz; cp ./mysql-connector-java-5.1.38/mysql-connector-java-5.1.38-bin.jar /usr/share/java/mysql-connector-java.jar; exit;"


    echo END $node

done < nodes
