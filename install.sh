#!/bin/env bash
nix shell nixpkgs#home-manager -c home-manager -b bak switch --flake ~/dotfiles/
