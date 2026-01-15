local map = vim.keymap.set

local vscode = require('vscode')

map('n', '<leader><leader>', function()
    vscode.action('workbench.action.quickOpen')
end)

map('n', '<leader>r', function() vscode.action('editor.action.rename') end)
map('n', '<leader>e', function() vscode.action('workbench.action.toggleSidebarVisibility') end)
map('n', ']d', function() vscode.action('editor.action.marker.next') end)
map('n', '[d', function() vscode.action('editor.action.marker.prev') end)

-- Format whole file in Normal Mode
map('n', '<leader>f', function()
    vscode.action('editor.action.formatDocument')
end)

map('n', '<leader>q', function()
    vscode.action('workbench.action.closeActiveEditor')
end)

-- Format selection in Visual Mode
map({'x', 'v'}, '<leader>f', function()
    vscode.action('editor.action.formatSelection')
end)

map('n', '<leader>p', function()
    vscode.action('workbench.action.showCommands')
end)

map('n', '<leader>s', function()
    vscode.action('workbench.action.gotoSymbol')
end)

map('n', '<leader>t', function()
    vscode.action('workbench.action.terminal.toggleTerminal')
end)

map('n', '<leader>or', function()
    vscode.action('workbench.action.openRecent')
end)

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = {"*"},
    callback = function()
        map("n", "-", function() vscode.action('oil-code.open') end)
    end,
})

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {"oil"},
    callback = function()
        map("n", "-", function() vscode.action('oil-code.openParent') end)
        map("n", "_", function() vscode.action('oil-code.openCwd') end)
        map("n", "<CR>", function() vscode.action('oil-code.select') end)
        map("n", "<C-t>", function() vscode.action('oil-code.selectTab') end)
        map("n", "<C-l>", function() vscode.action('oil-code.refresh') end)
        map("n", "`", function() vscode.action('oil-code.cd') end)
    end,
})