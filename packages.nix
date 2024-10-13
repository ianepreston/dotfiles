{ config, pkgs, ... }: {

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.starship
    # pkgs.blesh
    pkgs.fish
    pkgs.fzf
    pkgs.curl
    pkgs.wget
    pkgs.unzip
    pkgs.gnumake
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fd
    pkgs.lazygit
    pkgs.neofetch
    pkgs.markdownlint-cli
    pkgs.jq
    pkgs.shellcheck
    pkgs.direnv
    pkgs.nix-direnv
    pkgs.devenv
    pkgs.devpod
    pkgs.nixfmt
    pkgs.keychain
    pkgs.sops
    pkgs.age

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

}
