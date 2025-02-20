return {
    {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = {},
        version = "*",
        opts = {
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
                },
            },
            signature = {
                enabled = true,
            },

            keymap = {
                preset = "default",
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-space>"] = { "accept", "fallback" },
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = true },
                },

                documentation = {
                    auto_show = true,
                },
                list = {
                    selection = {
                        auto_insert = false,
                    },
                },
            },
        }
    },
}
