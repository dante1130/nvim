vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_transparency = 0.9
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
                        accept = "<S-Tab>",
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
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^3', -- Recommended
        ft = { 'rust' },
    },
}
