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
      alias vim="nvim"
      alias vi="nvim"
    '';
    oh-my-zsh = {
      enable = true;
      extraConfig = ''
        zstyle :omz:plugins:keychain agents gpg,ssh
        zstyle :omz:plugins:keychain identities id_ed25519 id_rsa
        zstyle :omz:plugins:keychain options --quiet --ignore-missing -Q
      '';
      plugins = [ "keychain" ];
    };
  };
}
