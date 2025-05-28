return {

  -- ====================--
  --  Disabling plugin  --
  --====================--

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  -- ======================--
  --  null-ls equivalent  --
  --======================--

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- ===============================--
  --  completion and highlighting  --
  --===============================--

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "zbirenbaum/copilot.lua",
    opts = require "configs.copilot",
    event = "VeryLazy",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = require "configs.nvim-cmp",
  },

  {
    "L3MON4D3/LuaSnip",
    opts = {
      enable_autosnippets = true,
    },
  },

  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    config = function()
      require "configs.sonarlint"
    end,
    ft = {
      "python",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "css",
      "dockerfile",
    },
  },

  -- ============--
  --  Ai Stuff  --
  --============--

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    opts = require "configs.codecompanion-nvim",
    lazy = false,
    init = function()
      require("configs.codecompanion-nvim.fidget-spinner"):init()
    end,
  },

  -- ============--
  --  Debugger  --
  --============--

  {
    "mfussenegger/nvim-dap",
    config = require "configs.nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- =====================--
  --  Text manipulation  --
  --=====================--

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "v" } },
      "<C-Down>",
      "<C-Up>",
    },
  },

  -- ============--
  --  UI stuff  --
  --============--

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = require "configs.snacks-nvim",
    keys = require "configs.snacks-nvim-keys",
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = require "configs.smear-cursor",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "configs.noice-nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require "mini.diff"
      diff.setup {
        source = diff.gen_source.none(),
        view = {
          style = "sign",
          signs = { add = "▒", change = "▒", delete = "▒" },
        },
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = require "configs.oil-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
  },

  -- ==============--
  --  Navigation  --
  --==============--

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/flash.nvim",
    keys = require "configs.flash-nvim",
  },

  -- =============== --
  --  Comment shit   --
  -- =============== --

  {
    "EwenSellitto/epiheader.nvim",
    opts = {},
    keys = { "<leader>eh", mode = { "n" }, desc = "Create header" },
  },

  {
    "EwenSellitto/commentor.nvim",
    opts = {},
    keys = { "<leader>ec", mode = { "n" }, desc = "Create beacon" },
  },

  {
    "folke/todo-comments.nvim",
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },

  {
    "danymat/neogen",
    config = true,
    cmd = "Neogen",
  },

  -- ===========--
  --  Folding  --
  --===========--

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VimEnter", -- needed for folds to load in time and comments closed
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldcolumn = "0"
    end,
    opts = require "configs.nvim-ufo",
  },

  -- ===================== --
  --  Note taking plugins  --
  -- ===================== --

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = require "configs.obsidian-cmd",
    config = function()
      require "configs.obsidian"
    end,
    keys = {
      { "<leader>of", mode = { "n" }, desc = "Obsidian follow link" },
      { "<leader>od", mode = { "n" }, desc = "Toggle Checkbox" },
      { "<leader>os", "<cmd>ObsidianSearch<CR>", mode = { "n" }, desc = "Obsidian search" },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = require "configs.zen-mode",
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      latex = {
        enabled = false,
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown", "codecompanion" },
    lazy = true,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- =============================--
  --  language specific plugins  --
  --=============================--

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    ft = "rust",
    config = require "configs.rustaceanvim",
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = require "configs.crates-nvim",
  },

  -- ================--
  --  Random Stuff  --
  --================--

  {
    "nvim-telescope/telescope.nvim",
    config = require("configs.telescope").config,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  -- ==============--
  --  Plugin Dev  --
  --==============--

  -- {
  --   "EwenSellitto/mark-math",
  --   opts = {},
  --   dev = true,
  --   dir = vim.fn.expand "~" .. "/Documents/PERSO/mark-math/",
  --   ft = { "markdown" },
  -- },
}
