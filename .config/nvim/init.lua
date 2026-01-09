vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.g.localleader = ' '
local map = vim.keymap.set

map('n', '<leader>w', ':w<CR>')
map({'x', 'v'}, 'x', '"_d')
map('n', '<esc>', ':nohl<CR><esc>')

map({'v', 'x'}, '<', '<gv')
map({'v', 'x'}, '>', '>gv')

-- copy and paste over ssh
vim.schedule(function()
    vim.opt.clipboard:append('unnamedplus')

    if vim.env.SSH_TTY then
        vim.g.clipboard = {
            name = 'OSC 52',
            copy = {
                ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
                ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
            },
            paste = {
                ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
                ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
            },
        }
    end
end)

if vim.g.vscode then
    require 'user.vscode'
else
    map('n', '<leader>f', ':Explore<CR>')
    map('n', '<leader>q', ':q<CR>')
end