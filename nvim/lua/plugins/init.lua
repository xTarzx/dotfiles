return {
    --[[
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer"  },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args) 
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

            })
        end,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",  
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "saadparwaiz1/cmp_luasnip",
            },
        },
    },
    --]]
}
