#!/usr/bin/env bash
# Example.

COMMON="--data-dir ./data/VOCdevkit --data-year 2012 --arch ssd300 --num-epochs 120 --batch-size 32"
SNAPSHOT_PATH=/training-data/tmp

# just flipping
echo "RUN: FLIP 1/2"
python train.py $COMMON --augment-type flip --tag flip-normal --checkpoint-dir checkpoints/flip-normal
echo "RUN: FLIP 2/2"
python train.py $COMMON --augment-type flip --caching-period -1 --tag flip-cache --snapshot-path $SNAPSHOT_PATH

# just patch
echo "RUN: PATCH 1/2"
python train.py $COMMON --augment-type patch --tag patch-normal
echo "RUN: PATCH 2/2"
python train.py $COMMON --augment-type patch --caching-period -1 --tag patch-cache --snapshot-path $SNAPSHOT_PATH

#python train.py $COMMON --augment-type flip --caching-period 3 --tag flip-period3 --snapshot_path $SNAPSHOT_PATH
#python train.py $COMMON --augment-type patch --caching-period 3 --tag patch-period3 --snapshot_path $SNAPSHOT_PATH
