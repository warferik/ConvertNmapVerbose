#!/bin/bash
# Used to Convert Verbose Nmap SYN scans to version and script scan on open ports only

for i in $(cat $1 | grep Disc | awk '{print $6}' | sort -u);
do
        ports=""
        ports=($(grep $i $1 | grep Disc | awk '{print $4}'| tr -d "/tcp"))
        printf -v joined '%s,' "${ports[@]}"
        nmap -v -Pn -n -sVC -p ${joined%,} $i >> $i.txt
done
