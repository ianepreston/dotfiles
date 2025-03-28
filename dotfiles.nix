{ config, pkgs, ... }:
{

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".gitconfig".source = ./gitconfig;
    ".gitconfig-wcb".source = ./gitconfig-wcb;
    ".bashrc".source = ./bashrc;
    ".config/starship.toml".source = ./starship.toml;
    ".taloscomplete.zsh".source = ./taloscomplete.zsh;
    # Any scripts I add here should be on my path
    ".local/bin" = {
      source = ./scripts;
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
}
