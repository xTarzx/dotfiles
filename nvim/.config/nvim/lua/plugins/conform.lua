return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "zapling/mason-conform.nvim",
        opts = {
            ensure_installed = { "beautysh", "black", "yamlfmt" },
        },
        dependencies = "stevearc/conform.nvim",
    },
}
