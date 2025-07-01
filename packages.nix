{ config, pkgs, ... }:
{

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.starship
    pkgs.dig
    pkgs.whois
    pkgs.fzf
    pkgs.curl
    pkgs.wget
    pkgs.unzip
    pkgs.tree
    pkgs.ripgrep
    pkgs.fd
    pkgs.lazygit
    pkgs.neofetch
    pkgs.jq
    pkgs.yq-go
    pkgs.gemini-cli
    pkgs.claude-code
    pkgs.shellcheck
    pkgs.direnv
    pkgs.nix-direnv
    pkgs.nixfmt-rfc-style
    pkgs.keychain
    pkgs.sops
    pkgs.age
    pkgs.devenv
  ];

}
