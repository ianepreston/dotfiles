{
  description = "Home Manager configuration of ipreston";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."ipreston" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          nixvim.homeManagerModules.nixvim
          ./ipreston.nix
          ./home.nix
          ./zellij.nix
          ./packages.nix
          ./dotfiles.nix
          ./nixvim
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      # Also create one for if I'm in a devcontainer
      homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.

        modules = [
          ./root.nix
          ./home.nix
          ./packages.nix
          ./dotfiles.nix
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeConfigurations."vscode" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./vscode.nix
          ./home.nix
          ./packages.nix
          ./dotfiles.nix
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      # WSL
      homeConfigurations."e975360" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          nixvim.homeManagerModules.nixvim
          ./workwsl.nix
          ./news.nix
          ./home.nix
          ./zellij.nix
          ./packages.nix
          ./dotfiles.nix
          ./nixvim
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeConfigurations."e975360@WCB.AB.CA" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          nixvim.homeManagerModules.nixvim
          ./work.nix
          ./news.nix
          ./home.nix
          ./zellij.nix
          ./packages.nix
          ./dotfiles.nix
          ./nixvim
          ./zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };
}
