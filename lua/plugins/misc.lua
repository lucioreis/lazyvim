return {
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  { "sigmasd/deno-nvim", lazy = false, enabled = false },
  { "folke/flash.nvim", enabled = false },
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
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
}
