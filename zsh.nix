{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      save = 10000;
      share = true;
      size = 10000;
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
