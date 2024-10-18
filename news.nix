{ config, pkgs, ... }: {

  # The home.packages option allows you to install Nix packages into your
  # environment.
  news = {
	display = "silent";
	entries = pkgs.lib.mkForce [ ];
	json = pkgs.lib.mkForce { };
  };
}
