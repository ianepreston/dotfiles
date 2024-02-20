return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        require("lualine").setup {
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff", "diagnostics"},
                    lualine_c = {"filename"},
                    lualine_x = {"buffers"},
                    lualine_y = {"tabs"},
                    lualine_z = {"windows"},
                }
        }

    end
}
