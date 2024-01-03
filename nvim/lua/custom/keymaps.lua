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
