#!/bin/bash

while read node
do
   echo BEGIN $node

   #commands go here
        echo "reading file - value $node"  
    echo END $node

done < nodes
