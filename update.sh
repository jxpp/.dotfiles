#!/usr/bin/env sh

for s in $(cat stowable)
do
    stow $s
done
