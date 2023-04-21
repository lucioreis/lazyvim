return {
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "windwp/nvim-spectre", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  { "sigmasd/deno-nvim", lazy = false, enabled = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "Shatur/neovim-session-manager",
    ---@diagnostic disable-next-line: unused-local
    opts = function(_, opts)
      return {
        -- sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        -- path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        -- colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit.
        -- autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
        -- autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
      }
    end,
    cmd = "SessionManager",
    event = "VimLeave",
    ft = "alpha",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "TimUntersberger/neogit",
    dependencies = {
      { "sindrets/diffview.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = { { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" } },
    opts = {
      disable_commit_confirmation = false,
      integrations = {
        diffview = true,
      },
    },
    cmd = "Neogit",
  },
  {
    "lewis6991/gitsigns.nvim",
    --stylua: ignore
    keys = {
      {
        "<leader>gj",
        function() require('gitsigns').next_hunk({navigation_message = false}) end,
        desc = "Next Hunk"
      },{
        "<leader>gk",
        function() require('gitsigns').prev_hunk({navigation_message = false}) end,
        desc = "Previous Hunk"
      },
      {
        "<leader>gl",
        function() require('gitsigns').blame_line() end,
        desc = "Blame Line"
      },
      {
        "<leader>gp",
        function() require('gitsigns').preview_hunk() end,
        desc = "Preview Hunk"
      },
      {
        "<leader>gr",
        function() require('gitsigns').reset_hunk() end,
        desc = "Reset Hunk"
      },
      {
        "<leader>gR",
        function() require('gitsigns').reset_buffer() end,
        desc = "Reset Buffer"
      },
      {
        "<leader>gs",
        function() require('gitsigns').stage_hunk() end,
        desc = "Stage Hunk"
      },
      {
        "<leader>gu",
        function() require'gitsigns'.undo_stage_hunk() end,
        desc = "Undo Stage Hunk"
      },
    },
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
    enabled = true,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
  },
}
