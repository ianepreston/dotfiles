{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts.border = "rounded";
        shading_factor = 2;
        size = 10;

        highlights = {
          Normal.link = "Normal";
          NormalNC.link = "NormalNC";
          NormalFloat.link = "NormalFloat";
          FloatBorder.link = "FloatBorder";
          StatusLine.link = "StatusLine";
          StatusLineNC.link = "StatusLineNC";
          WinBar.link = "WinBar";
          WinBarNC.link = "WinBarNC";
        };

      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<Leader>lf";
        action = "<Cmd>ToggleTerm direction=float<CR>";
        options.desc = "Open floating terminal";
      }
      {
        mode = "n";
        key = "<Leader>lh";
        action = "<Cmd>ToggleTerm size=10 direction=horizontal<CR>";
        options.desc = "Open terminal in horizontal split";
      }
      {
        mode = "n";
        key = "<Leader>lv";
        action = "<Cmd>ToggleTerm size=80 direction=vertical<CR>";
        options.desc = "Open terminal in vertical split";
      }
      {
        mode = "n";
        key = "<F7>";
        action = "<Cmd>execute v:count . 'ToggleTerm'<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "t";
        key = "<F7>";
        action = "<Cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "i";
        key = "<F7>";
        action = "<Esc><Cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Switch to normal mode";
      }
      {
        mode = [ "n" "t" ];
        key = "<Leader>ln";
        action.__raw = ''
          function()
            local curterm = require("toggleterm.terminal").get_focused_id()

            if curterm ~= nil then
              vim.cmd(curterm .. "ToggleTermSetName")
            end
          end
        '';
        options.desc = "Rename current terminal";
      }
      {
        mode = [ "n" "t" ];
        key = "<Leader>ll";
        action = "<cmd>TermSelect<cr>";
        options.desc = "List terminals";
      }
    ];

  };
}
