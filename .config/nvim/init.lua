vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.scrolloff = 10

vim.g.mapleader = ' '
vim.g.localleader = ' '
local map = vim.keymap.set

map('n', '<leader>w', ':w<CR>')
map('n', '<esc>', ':nohl<CR><esc>')

map('n', '<leader>q', ':q<CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

map({'n', 'v'}, '<leader>d', '"_d')

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
end