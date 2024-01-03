local comform = require "conform"
comform.setup {
  formatters_by_ft = {
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    svelte = { "prettierd" },
    vue = { "prettierd" },
    astro = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    handlebars = { "prettierd" },
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  comform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end, { desc = "Format file or range (visual mode)" })
