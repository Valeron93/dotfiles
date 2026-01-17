vim.g.mapleader = " "
vim.g.localleader = " "

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.wrap = true
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.undofile = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.breakindent = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250

vim.o.mouse = "a"
vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.g.have_nerd_font = true

-- copy and paste over ssh
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")

	if vim.env.SSH_TTY then
		vim.g.clipboard = {
			name = "OSC 52",
			copy = {
				["+"] = require("vim.ui.clipboard.osc52").copy("+"),
				["*"] = require("vim.ui.clipboard.osc52").copy("*"),
			},
			paste = {
				["+"] = require("vim.ui.clipboard.osc52").paste("+"),
				["*"] = require("vim.ui.clipboard.osc52").paste("*"),
			},
		}
	end
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<esc>", ":nohlsearch<CR>")

map("n", "<leader>q", ":q<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map({ "n", "v" }, "<leader>d", '"_d')

-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup("plugins")
