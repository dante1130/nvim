local rt = require("rust-tools")

local extension_path = vim.env.HOME .. "~/.vscode/extensions/vadimcn.vscode-lldb-1.9.2"
local codelldb_path = extension_path .. "/adapter/codelldb.exe"
local liblldb_path = extension_path .. "/lldb/bin/liblldb.dll"

local opts = {
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,

        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },

    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    }
}

rt.setup(opts);

