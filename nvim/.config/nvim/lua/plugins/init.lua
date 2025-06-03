return {
    {
        "tpope/vim-fugitive"
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = { completions = { blink = { enabled = true } } },

    },
    {
        'cameron-wags/rainbow_csv.nvim',
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function ()
            require("nvim-surround").setup({
            })
        end
    }
}
