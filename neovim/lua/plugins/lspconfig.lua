return {
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })
      end)

      require("lazy-lsp").setup {
        excluded_servers = {
          "ccls",                              -- prefer clangd
          "denols",                            -- prefer eslint and tsserver
          "docker_compose_language_service",   -- yamlls should be enough?
          "flow",                              -- prefer eslint and tsserver
          "ltex",                              -- grammar tool using too much CPU
          "quick_lint_js",                     -- prefer eslint and tsserver
          "rnix",                              -- archived on Jan 25, 2024
          "scry",                              -- archived on Jun 1, 2023
          "tailwindcss",                       -- associates with too many filetypes
        },
        preferred_servers = {
          markdown = {},
          python = { "pyright", "ruff_lsp" },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
