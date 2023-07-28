#!/bin/bash
while true; do

    while read j
    do
       echo "file changed"
       ./command
       echo "Written"
    done <  <(inotifywait -q -e modify ./command)
done


