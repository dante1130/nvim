vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)

local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = "${port}",
    executable = {
        command = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/adapter/codelldb.exe",
        args = {"--port", "${port}"}
    }
}

dap.configurations.rust = {
    {
        name = "Debug",
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

