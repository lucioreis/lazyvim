return {
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },

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
    opts = {
      integrations = {
        diffview = true,
      },
    },
    cmd = "Neogit",
  },
}