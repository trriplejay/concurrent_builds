#!/bin/bash

PIDS=()

for i in $(seq 1 5);
do
  NAME="svc$i"
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
