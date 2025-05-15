return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "smjonas/inc-rename.nvim",
        opts = {
            save_in_cmdline_history = false,
        }
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local lspconfig = require("lspconfig")

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local conform = require("conform")

                    local rename_func = function()
                        return ":IncRename " .. vim.fn.expand("<cword>")
                    end

                    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
                    local bufopts_expr = { expr = true }
                    vim.keymap.set("n", "<leader>rn", rename_func, bufopts_expr)
                    vim.keymap.set("n", "<leader>kf", function() conform.format({ lsp_fallback = true }) end, bufopts)
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
                end,
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        hint = { enable = true },
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
            })

            lspconfig["basedpyright"].setup({
                capabilities = capabilities,
            })

            lspconfig["clangd"].setup({
                capabilities = capabilities,
            })

            lspconfig["bashls"].setup({
                capabilities = capabilities,
            })

            lspconfig["eslint"].setup({
                capabilities = capabilities,
            })
            lspconfig["ts_ls"].setup({
                capabilities = capabilities,
            })

            lspconfig["cmake"].setup({
                capabilities = capabilities,
            })
            lspconfig["glsl_analyzer"].setup({
                capabilities = capabilities,
            })
            lspconfig["yamlls"].setup({
                capabilities = capabilities,
            })
            lspconfig["sqlls"].setup({
                capabilities = capabilities,
            })
            lspconfig["cssls"].setup({
                capabilities = capabilities,
            })
            lspconfig["hyprls"].setup({
                capabilities = capabilities,
            })
            lspconfig["jsonls"].setup({
                capabilities = capabilities,
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "basedpyright",
                "bashls",
                "eslint",
                "ts_ls",
                "cmake",
                "glsl_analyzer",
                "yamlls",
                "sqlls",
                "cssls",
                "hyprls",
                "jsonls",
            },
            automatic_installation = true,
        },
        dependencies = "williamboman/mason.nvim",
    },

}
