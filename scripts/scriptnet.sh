#!/bin/bash
if [ "$1" == "" ];
then
        echo "Url Analizer"
        echo "HowTo: ./scriptnet.sh www.grayhats.org"
else
        wget -q $1
        grep href index.html | cut -d "/" -f3 | grep "\." | cut -d '"' -f1 | sort -u | grep -v '<li' > lista
        for url in $(cat lista);do host -T $url | grep "has address" ;done
        rm lista
        rm index.html
fi

