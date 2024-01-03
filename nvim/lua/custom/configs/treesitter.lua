local options = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "go",
    "toml",
    "tsx",
    "css",
    "html",
    "lua",
    "vue",
    "astro",
    "dart",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "css",
      "lua",
      "xml",
      "php",
      "markdown",
      "astro",
    },
  },
  indent = { enable = true },
}
require("nvim-ts-autotag").setup(options)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    severity_limit = "Warning",
  },
  update_in_insert = true,
})
