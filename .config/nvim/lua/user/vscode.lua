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

map('n', '<leader>d', function() 
    vscode.action('editor.action.revealDefinition') 
end)

map('n', '<leader>t', function() 
    vscode.action('workbench.action.terminal.toggleTerminal') 
end)
