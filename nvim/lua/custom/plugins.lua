local plugins = {
  -- UI
  -- {
  -- "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --   -- add any options here
  --   },
  --   dependencies = {
  --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function ()
  --     require "custom.configs.noice"
  --   end
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lsp = {
      servers = {
        "dartls",
      },
      setup_handlers = {
        -- add custom handler
        dartls = function(_, opts)
          require("flutter-tools").setup { lsp = opts }
        end,
      },
      config = {
        dartls = {
          -- any changes you want to make to the LSP setup, for example
          color = {
            enabled = true,
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
    disable = true,
  },
  {
    "samodostal/image.nvim",
    config = function()
      require("image").setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
  },
  -- {
  --   lazy = true,
  --   event = "VeryLazy",
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   opts = {
  --     filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  --   },
  --   config = function(_, opts)
  --     vim.api.nvim_create_autocmd("FileType", {
  --       group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
  --       pattern = opts.filetype_exclude,
  --       callback = function()
  --         require("ufo").detach()
  --       end,
  --     })
  --
  --     vim.opt.foldlevelstart = 99
  --     require("ufo").setup(opts)
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.prettier"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  --

  -- Lsp Entry
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "eslint-lsp",
        "json-lsp",
        "prettier",
        "prettierd",
        "vue-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  --

  -- Lsp configs
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require "plugins.configs.treesitter"
  --   end,
  -- },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter"
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  --
}

return plugins
