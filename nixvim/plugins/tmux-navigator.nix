{ config, pkgs, inputs, ... }:

{
  programs.nixvim = { plugins.tmux-navigator = { enable = true; }; };
}
