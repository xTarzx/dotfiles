require("core.variables")
require("core.package_manager")
require("core.theme")

-- summon terminal
local term_win = nil
local term_buf = nil
function TermToggle(height)
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        if term_win == vim.api.nvim_get_current_win() then
            vim.cmd("hide")
        else
            vim.api.nvim_set_current_win(term_win)
            vim.cmd("startinsert!")
        end
    else
        vim.cmd("botright new")
        local new_buf = vim.api.nvim_get_current_buf()
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.cmd("buffer " .. term_buf)
            vim.cmd("bd " .. new_buf)
        else
            vim.cmd("term")
            term_buf = vim.api.nvim_get_current_buf()
            vim.wo.number = false
        end
        vim.cmd("startinsert!")
        term_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_height(term_win, height)
    end
end


local termtoggle_desc = "Toggle terminal"
local term_height = 15
vim.keymap.set("n", "<A-ç>", string.format(":lua TermToggle(%d)<CR>", term_height), { noremap = true, silent = true, desc = termtoggle_desc })
vim.keymap.set("t", "<A-ç>", string.format("<C-\\><C-n>:lua TermToggle(%d)<CR>", term_height),
    { noremap = true, silent = true, desc = termtoggle_desc })
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {})


-- telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })



vim.opt.shortmess:append("I")
