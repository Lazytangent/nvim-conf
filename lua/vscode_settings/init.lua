local keymap = vim.keymap.set

-- @param string action string
local function vscode_action(action)
  return function()
    require('vscode').action(action)
  end
end

keymap({"n", "v"}, "<leader>t", vscode_action('workbench.action.terminal.toggleTerminal'))
keymap({"n", "v"}, "<leader>d", vscode_action('editor.debug.showHover'))
keymap({"n", "v"}, "<leader>a", vscode_action('editor.action.quickFix'))
keymap({"n", "v"}, "<leader>sp", vscode_action('workbench.action.view.problems'))
keymap({"n", "v"}, "<leader>sn", vscode_action('notifications.clearAll'))
keymap({"n", "v"}, "<leader>ff", vscode_action('workbench.action.quickOpen'))
keymap({"n", "v"}, "<leader>cp", vscode_action('workbench.action.showCommands'))
keymap({"n", "v"}, "<leader>pr", vscode_action('code-runner.run'))
keymap({"n", "v"}, "<leader>fd", vscode_action('editor.action.formatDocument'))
