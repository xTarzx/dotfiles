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

            completion = {
                accept = {
                    auto_brackets = { enabled = true },
                },

                documentation = {
                    auto_show = true,

                },
            },
        }
    },
}
