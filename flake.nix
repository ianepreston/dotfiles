{
  description = "Home Manager configuration of ipreston";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations."ipreston" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./ipreston.nix
          ./home.nix
          ./packages.nix
          ./dotfiles.nix
          ./zsh.nix
          ./neovim.nix
        ];
      };
      homeConfigurations."e975360@WCB.AB.CA" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./work.nix
          ./home.nix
          ./packages.nix
          ./dotfiles.nix
          ./zsh.nix
          ./neovim.nix
        ];
      };

    };
}
