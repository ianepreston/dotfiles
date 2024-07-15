{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
    keymaps = [{
      key = "<leader>lg";
      action = "<cmd>LazyGit<cr>";
      options = { desc = "LazyGit"; };
    }];
    plugins.lazygit = { enable = true; };
  };
}
