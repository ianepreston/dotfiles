{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    plugins.neotest = {
      enable = true;
      adapters.python.enable = true;
    };
    keymaps = [
      {
        key = "<leader>t";
        action = "";
        options.desc = "+test";
      }
      {
        key = "<leader>tt";
        action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
        options.desc = "Run File";
      }
      {
        key = "<leader>tT";
        action = "<cmd>lua require('neotest').run.run(vim.uv.cwd())<CR>";
        options.desc = "Run All Test Files";
      }
      {
        key = "<leader>tr";
        action = "<cmd>lua require('neotest').run.run()<CR>";
        options.desc = "Run Nearest";
      }
      {
        key = "<leader>tl";
        action = "<cmd>lua require('neotest').run.run_last()<CR>";
        options.desc = "Run Last";
      }
      {
        key = "<leader>ts";
        action = "<cmd>lua require('neotest').summary.toggle()<CR>";
        options.desc = "Toggle Summary";
      }
      {
        key = "<leader>to";
        action =
          "<cmd>lua require('neotest').output.open({enter = true, auto_close = true})<CR>";
        options.desc = "Show Output";
      }
      {
        key = "<leader>tO";
        action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
        options.desc = "Toggle Output Panel";
      }
      {
        key = "<leader>tS";
        action = "<cmd>lua require('neotest').run.stop()<CR>";
        options.desc = "Stop";
      }
      {
        key = "<leader>tW";
        action =
          "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<CR>";
        options.desc = "Toggle Watch";
      }
    ];

  };
}
