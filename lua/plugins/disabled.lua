return {
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  { import = "lazyvim.plugins.extras.lang.typescript" },
}
