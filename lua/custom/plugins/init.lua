vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "BufRead",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<Tab>",
                    }
                },
            })
        end
    },
    { 'mbbill/undotree', },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    }
}
