return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "c", "python", "zig", "rust" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
