#!/bin/bash

DIR_PREFIX=svc
PIDS=()

for i in $(seq 1 16);
do
  NAME=$DIR_PREFIX$i
  echo "name is: $NAME"
  docker build --no-cache -t trriplejay/$NAME:latest . &
  PIDS[${i}]=$!
done

for pid in ${PIDS[*]};
do
  echo "waiting on process $pid"
  wait $pid
  echo "Process $pid exited with status $?"
done
