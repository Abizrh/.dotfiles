local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

-- local lspconfig = require"lspconfig"

local servers = {
  "lua_ls",
  "cssls",
  "html",
  "pyright",
  "vuels",
  "bashls",
  "jsonls",
  "yamlls",
  "volar",
  "emmet_ls",
  "intelephense",
  "gopls",
  "marksman",
  "dartls",
}

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "tsconfig.node.json"),
  init_options = {
    preferences = {
      disableSuggestions = true,
      quotePreference = "double",
    },
  },
}

for _, server in pairs(servers) do
  require("lspconfig")[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- require"lspconfig".vuels.setup{
--   on_attach = on_attach,
--   capabilities = capabilities
-- }
