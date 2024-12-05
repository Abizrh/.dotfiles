vim.opt.guicursor = ""
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.g.dap_virtual_text = true
vim.cmd [[ autocmd FileType vue let b:lazy_active = 1 ]]
vim.opt.relativenumber = true
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "*/node_modules/"
vim.opt.wildignore:append "*/.git/"

-- Mengatur bentuk kursor untuk mode yang berbeda
-- vim.opt.guicursor = {
--   "n-v-c:block-Cursor/lCursor-blinkon0",
--   "i-ci:ver25-Cursor/lCursor",
--   "r-cr:hor20-Cursor/lCursor"
-- }
--
-- -- Atau, Anda bisa memisahkan pengaturan untuk setiap mode:
-- -- Mode normal: kursor blok
-- vim.opt.guicursor:append("n-v-c:block-Cursor")
-- -- Mode insert: kursor garis vertikal
-- vim.opt.guicursor:append("i-ci:ver25-Cursor")
-- -- Mode replace: kursor garis horizontal
-- vim.opt.guicursor:append("r-cr:hor20-Cursor")

-- Jika Anda ingin kursor berkedip, tambahkan 'blinkon1' di akhir setiap pengaturan
-- Contoh: vim.opt.guicursor:append("n-v-c:block-Cursor/lCursor-blinkon1")

-- Untuk mematikan kedipan kursor, gunakan 'blinkon0'
-- Contoh: vim.opt.guicursor:append("n-v-c:block-Cursor/lCursor-blinkon0")

-- yank highlight
vim.api.nvim_exec(
  [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
  augroup END
]],
  false
)
-- vim.builtin.treesitter.autotag.enable = true
-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd({ "FileType" }, {
--   pattern = { "javascriptreact", "typescriptreact", "tsx", "jsx" },
--   callback = function()
--     vim.bo.commentstring = "{/* %s */}"
--   end
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "javascriptreact", "typescriptreact", "tsx", "jsx" },
--   callback = function()
--     vim.bo.commentstring = "{/* %s */}"
--     print("Commentstring set for React file: " .. vim.bo.commentstring)
--   end
-- })
