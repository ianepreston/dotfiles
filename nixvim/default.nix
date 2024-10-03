{ inputs, ... }: {
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins/autopairs.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/debug.nix
    ./plugins/gitsigns.nix
    ./plugins/indent-blankline.nix
    ./plugins/lazygit.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/mini.nix
    ./plugins/neotest.nix
    ./plugins/oil.nix
    ./plugins/telescope.nix
    ./plugins/toggleterm.nix
    ./plugins/tmux-navigator.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    globals.have_nerd_font = true;

    luaLoader.enable = true;
    colorschemes = {
      catppuccin = {
        enable = true;
        settings.flavour = "latte";
      };
    };
  };
}
