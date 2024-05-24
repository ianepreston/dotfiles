{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ipreston";
  home.homeDirectory = "/home/ipreston";
  # Whether to enable settings that make Home Manager work better on GNU/Linux distributions other than NixOS
  targets.genericLinux.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.fish
    pkgs.starship
    pkgs.neovim
    pkgs.curl
    pkgs.wget
    pkgs.unzip
    pkgs.gnumake
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fd
    pkgs.lazygit
    pkgs.neofetch
    pkgs.jq
    pkgs.shellcheck
    pkgs.direnv
    pkgs.nix-direnv
    pkgs.devbox


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

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
    ".config/fish/config.fish".source = ./config.fish;
    ".config/starship.toml".source = ./starship.toml;
    ".config/pypoetry/config.toml".source = ./pypoetry/config.toml;
    ".config/fish/completions/poetry.fish".source = ./pypoetry/poetry.fish;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
# Uncomment this after you can update to 2.21.3
#  xdg.configFile = {
#    nvim = {
#      source =
#        config.lib.file.mkOutOfStoreSymlink
#          "${config.home.homeDirectory}/dotfiles/neovim";
#      recursive = true;
#    };
#  };
home.activation = {
# This was using .config and mkOuOfStoreSymlink, but it is broken in recent nix
# see https://github.com/nix-community/home-manager/issues/4692
    updateLinks = ''
      export ROOT="${config.home.homeDirectory}/dotfiles"
      ln -sf "$ROOT/neovim" .config/nvim
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ipreston/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
