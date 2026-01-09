
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.g.mapleader = ' '
vim.g.localleader = ' '
local map = vim.keymap.set

map('n', '<leader>w', ':w<CR>')
map({'x', 'v'}, 'x', '"_d')
map('n', '<esc>', ':nohl<CR><esc>')


if vim.g.vscode then
    require 'user.vscode'
else
    map('n', '<leader>f', ':Explore<CR>')
    map('n', '<leader>q', ':q<CR>')
end