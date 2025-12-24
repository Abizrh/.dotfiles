local plugins = {
  -- UI
  -- {
  --   "Abizrh/beastie.nvim",
  --   lazy = false, -- needed so the beastie can start at launch
  --   opts = {
  --     beasties = {
  --       {
  --         name = "cat",
  --         frames = { "🐱", "😺", "😸", "😹", "😼", "😽" }
  --       },
  --       {
  --         name = "love",
  --         frames = { "❤️", "💛", "💚", "💙", "💜", "💓", "💘" }
  --       },
  --       {
  --         name = "fairy",
  --         frames = { "🧚", "🧚", "🧚", "🧚", "🧚", "🧚", "🧚" }
  --       },
  --       {
  --         name = "bug",
  --         frames = { "🪲" }
  --       }
  --     },
  --     start_at_launch = false,
  --     animation_speed = 200, -- ms
  --     active_beastie = "cat",
  --     animation = "random",  -- or "random"
  --   },
  -- },

  {
    'Abizrh/commit-ai.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    lazy = false,
    config = function()
      require('commit-ai').setup {
        icons = false,
        language = 'en', -- default language
        -- unopiniated commit conventions
        git_conventions = {
          docs = { icon = "📖", prefix = "docs", type = "Documentation changes" },
          fix = { icon = "🐛", prefix = "fix", type = "Bug fix" },
          feat = { icon = "✨", prefix = "feat", type = "New feature" },
          enhance = { icon = "⚡", prefix = "enhance", type = "Enhancement" },
          chore = { icon = "🧹", prefix = "chore", type = "Chore" },
          refactor = { icon = "⚠️", prefix = "refactor", type = "Breaking change" }
        },
        provider_options = {
          gemini = {
            model = 'gemini-2.0-flash',
            api_key = vim.env.GEMINI_API_KEY, -- assuming you have set GEMINI_API_KEY in .zshrc or .bashrc
            stream = false,
          },
        }
      }
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
    lazy = false,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    lazy = false, -- needed so the pomodoro can start at launch
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig",         -- optional
    },
    opts = {}                          -- your configuration
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false, -- needed so the pomodoro can start at launch
    dependencies = { "quentingruber/pomodoro.nvim" },
    config = function()
      require "custom.configs.lualine"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    lazy = false,
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = "VeryLazy",
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  -- {
  --   "quentingruber/pomodoro.nvim",
  --   lazy = false, -- needed so the pomodoro can start at launch
  --   opts = {
  --     start_at_launch = true,
  --     work_duration = 25,
  --     break_duration = 1,
  --     snooze_duration = 1, -- The additionnal work time you get when you delay a break
  --   },
  -- },
  -- Note taking
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },

  -- AI
  {
    "supermaven-inc/supermaven-nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "windwp/nvim-autopairs",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = "VeryLazy",

    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {}
    end,
    opts = {
      signs = true,      -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        ERROR = { icon = " ", color = "error", alt = { "ERROR" } },
      },
      highlight = {
        multiline = true,                -- enable multine todo comments
        multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- uses treesitter to match keywords in comments only
        max_line_len = 400,              -- ignore lines longer than this
        exclude = {},                    -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
    }
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "VeryLazy",
  },
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
        "volar",
        "svelte-language-server",
        "csharp-language-server",
        "jdtls",
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
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
  },
  -- {
  --   "chrisgrieser/nvim-tinygit",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.tinygit"
  --   end,
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-telescope/telescope.nvim", -- optional, but recommended
  --     "rcarriga/nvim-notify",          -- optional, but recommended
  --   },
  -- },

  -- NOTE: example rendering local plugin
  --:Lazy reload [plugin-module] (to reload the plugin)
  -- {
  --   dir = "~/Documents/personal/neovim-plugin/beastie.nvim/",
  --   name = "beastie.nvim",
  --   lazy = false, -- needed so the beastie can start at launch
  --   opts = {
  --     beasties = {
  --       {
  --         name = "cat",
  --         frames = { "🐱", "😺", "😸", "😹", "😼", "😽" }
  --       },
  --       {
  --         name = "love",
  --         frames = { "❤️", "💛", "💚", "💙", "💜", "💓", "💘" }
  --       },
  --       {
  --         name = "fairy",
  --         frames = { "🧚", "🧚", "🧚", "🧚", "🧚", "🧚", "🧚" }
  --       },
  --       {
  --         name = "bug",
  --         frames = { "🪲" }
  --       }
  --     },
  --     start_at_launch = false,
  --     animation_speed = 100, -- ms
  --     active_beastie = "cat",
  --     animation = "random",  -- or "random"
  --   },
  --   -- dependencies = {
  --   --   'hrsh7th/nvim-cmp',
  --   --   'nvim-telescope/telescope.nvim',
  --   -- },
  --   -- config = function()
  --   --   require('cmp').setup({
  --   --     sources = {
  --   --       { name = 'icons' }
  --   --     }
  --   --   })
  --   -- end
  -- },
}

return plugins
