#!/bin/sh

while true; do
        if [ "$(cmus-remote -Q)" == "" ]
        then
            echo -e "nowplaying.text=\"\"" | /usr/bin/awesome-client;
            sleep 5
            continue
        else

        playing=$(cmus-remote -Q | grep 'playing');

        status="playing"
        if [ "$playing" == "" ]
        then
            status="paused"
        fi

        title=$(cmus-remote -Q | sed -n 's/tag title \(.*\)/\1/p');
        title=$(echo $title | sed 's/\"/\\\"/g'); # escape title
        echo -e "nowplaying.text=\"<b>Now $status:</b> $title\"" | /usr/bin/awesome-client;
        sleep 1;
    fi
done
