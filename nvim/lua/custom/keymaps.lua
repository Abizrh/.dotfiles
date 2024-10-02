vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.api.nvim_set_keymap('n', '<leader>z', ':set wrap!<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- change chmode for executing file
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- vim.keymap.set("n", "<Space>", ":za<CR>")
-- vim.keymap.set("n", "<leader>zi", ":set foldmethod=indent<CR>")
-- vim.keymap.set("n", "<leader>zf", ":set foldmethod=syntax<CR>")



-- window navigation
-- TODO: need to change this keybind using <leader>, and also check condition if split is active then <leader>j, etc will worked!
vim.keymap.set("n", "<leader>i", ":split<CR>")

-- split below
vim.keymap.set("n", "<A-j>j", "<C-w>j", { silent = true })

-- split above
vim.keymap.set("n", "<A-j>k", "<C-w>k", { silent = true })

-- split right
vim.keymap.set("n", "<A-j>l", "<C-w>l", { silent = true })

-- split left
vim.keymap.set("n", "<A-j>h", "<C-w>h", { silent = true })


-- todo comments
vim.keymap.set("n", "<leader>tl", ":TodoLocList<CR>")
vim.keymap.set("n", "<leader>tf", ":TodoQuickFix<CR>")
vim.keymap.set("n", "<leader>tr", ":TodoTrouble<CR>")
vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>")
vim.keymap.set("n", "tn", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "tp", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
