#!/bin/bash

DIR_PREFIX=svc
PIDS=()

for i in $(seq 1 16);
do
  NAME=$DIR_PREFIX$i
  echo "name is: $NAME"
  pushd svc1
  docker build -t trriplejay/$NAME:latest . &
  PIDS[${i}]=$!
  popd
done

for pid in ${PIDS[*]};
do
  echo "waiting on process $pid"
  wait $pid
  echo "Prcoess $pid exited with status $?"
done
