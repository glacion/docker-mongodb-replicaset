#!/bin/bash

# Expects the amount of replicas that will be in the cluster in the first argument.
for i in $(seq 0 $1)
do
    COUNTER=0
    until mongo --host "mongo-${i}:27017" --eval "printjson(db.serverStatus())"
    do
        sleep 1
        COUNTER=$((COUNTER+1))
        if [[ ${COUNTER} -eq 30 ]]; then
            echo "mongo-${i} did not initialize within 30 seconds, exiting"
            exit 2
        fi
        echo "Waiting for mongo-${i} to initialize... ${COUNTER}/30"
    done
done

# All the nodes have been initialized, setup replicaset

mongo --host mongo-0:27017 < init.js
