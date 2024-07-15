{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    plugins.bufferline = { enable = true; };

  };
}
