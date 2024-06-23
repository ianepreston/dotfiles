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
  home.sessionVariables = { EDITOR = "vim"; };
}
