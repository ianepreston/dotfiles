{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Inserts matching pairs of parens, brackets, etc.
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html
  programs.nixvim = {
    plugins.mkdnflow = {
      enable = true;
      filetypes = {
        md = true;
        rmd = true;
        markdown = true;
        qmd = true;
      };
    };

  };
}
