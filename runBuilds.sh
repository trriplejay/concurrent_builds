#!/bin/bash

DIR_PREFIX=svc
PIDS=()

for i in $(seq 1 16);
do
  NAME=$DIR_PREFIX$i
  echo "name is: $NAME"
  pushd $NAME
  docker build -t trriplejay/$NAME:latest . &
  PIDS[${i}]=$!
  popd
done

for pid in ${PIDS[*]};
do
  wait $pid
  echo "done waiting on $pid"
done
