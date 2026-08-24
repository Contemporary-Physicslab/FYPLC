#!/bin/zsh

cd "$(dirname "$0")"

pixi install
pixi run jupyter