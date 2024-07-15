{ config, pkgs, inputs, ... }: {
  programs.nixvim = { plugins.lazygit = { enable = true; }; };
}
