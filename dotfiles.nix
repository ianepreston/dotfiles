{ config, pkgs, ... }:
{

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".gitconfig".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/gitconfig";
    ".gitconfig-wcb".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/gitconfig-wcb";
    ".bashrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/bashrc";
    ".config/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship.toml";
    ".taloscomplete.zsh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/taloscomplete.zsh";
    # Any scripts I add here should be on my path
    ".local/bin" = {
      source = ./scripts;
      recursive = true;
    };
  };
}
