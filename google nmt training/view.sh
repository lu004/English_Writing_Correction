#!/bin/bash
source setting.sh

tensorboard --port 22222 --logdir $MODEL
