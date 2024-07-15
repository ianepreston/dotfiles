{ config, pkgs, ... }: {

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
    ".config/pypoetry/config.toml".source = ./pypoetry/config.toml;
    ".config/fish/config.fish".source = ./config.fish;
    ".config/fish/completions/poetry.fish".source = ./pypoetry/poetry.fish;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
}
