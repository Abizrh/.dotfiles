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
