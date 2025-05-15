return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "c", "python", "zig", "rust", "bash", "markdown", "markdown_inline", "html", },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
