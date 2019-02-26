#!/bin/bash
# Get category from file list of AJ urls


linklist=~/scripts/get-categories/linklist.txt
catlist=~/scripts/get-categories/catlist.txt
all_lines=`cat $linklist`

for lines in $all_lines ;
do
 printf "$lines     " | tee -a $catlist
 curl -s $lines \
 | grep '\"@type\":\"Product\",\"category\":' \
 | head -n1 \
 | sed 's/^.*\"@type\":\"Product\",\"category\":.//' \
 | sed 's/.,\"url\":\"https:.*//' \
 | tee -a $catlist
 sleep 1
done

