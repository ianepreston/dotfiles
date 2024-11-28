{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.nixvim = {
    # https://nix-community.github.io/nixvim/plugins/helm.html
    autoCmd = [
      {
        event = "FileType";
        pattern = "helm";
        command = "LspRestart";
      }
    ];
    plugins.helm = {
      enable = true;
      # Create autocommand to use the right language server
    };
  };
}
