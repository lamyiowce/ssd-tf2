#!/usr/bin/env bash
# Example.

COMMON=--data-dir ./data/VOCdevkit --data-year 2012 --arch ssd512 --num-epochs 120

python train.py $COMMON --augment-type flip
python train.py $COMMON --augment-type patch
python train.py $COMMON --augment-type flip patch