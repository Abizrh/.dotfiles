local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities
local home = os.getenv("HOME")

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
  "svelte",
  "clangd",
  "omnisharp",
  "jdtls",
}

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

require("lspconfig").ts_ls.setup {
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

require "lspconfig".volar.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
require "lspconfig".lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- C#
require("lspconfig").omnisharp.setup {
cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/OmniSharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },

  filetypes = { "cs", "vb" },

  root_dir = util.root_pattern("*.sln", "*.csproj", ".git"),

  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
}


-- Java
require("lspconfig").jdtls.setup {
  on_attach = on_attach,
  cmd = {
    home .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
    "-data",
    home .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
  },

}
