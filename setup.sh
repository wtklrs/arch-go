#!/usr/bin/env bash

__dirname="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

mkdir -p ~/.local/share/go
cp -r "$__dirname"/bin ~/.local/share/go
chmod +x ~/.local/share/go/bin/*
