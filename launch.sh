#!/bin/bash
# Bash Menu Script Example

PS3='Select script option: '
options=("Setup proxy" "Start proxy" "Stop proxy" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Setup proxy")
            echo "Initializing docker network..."
            docker network create proxy-net
            break
            ;;
        "Start proxy")
            echo "Starting proxy..."
            docker-compose up -d --build -V
            break
            ;;
        "Stop proxy")
            echo "Stoping proxy..."
            docker-compose down
            break
            ;;
        "Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done