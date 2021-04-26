#!/bin/bash

sudo apt install -y python3-dev python3-pip
pip install -U pip numpy wheel
pip install -U keras_preprocessing --no-deps
