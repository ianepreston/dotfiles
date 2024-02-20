vim.opt.number = true --show line numbers
vim.opt.relativenumber = true

vim.opt.tabstop = 4 -- how many columns of whitespace \t is worth
vim.opt.shiftwidth = 4 -- how many columns of whitespace a "level of indentation" is worth
vim.opt.softtabstop = 4 -- how many columns of whitespace a tab keypress is worth
vim.opt.expandtab = true -- turn \t into spaces

vim.opt.smartindent = true -- react to syntax and code style when determining next line indentation

vim.opt.hlsearch = true -- highlight all search matches rather than just the first one
vim.opt.incsearch = true -- highlight search matches as I'm typing

vim.opt.termguicolors = true -- might clean up my terminal colors? I'm not sure I need this

vim.opt.wrap = false -- no linewrap

vim.opt.scrolloff = 8 -- keep at least 8 lines visible around the cursor

vim.opt.signcolumn = "yes" -- think I need this for breakpoint indicator columns etc.

vim.opt.colorcolumn = "88" -- show a line length indicator set to the length that black uses
