local M = {
  "phaazon/hop.nvim",
  branch = "v2",
  keys = { { "s","<CMD>HopWord<CR>", mode = {"n", "v"}, desc = "HopWord" } },
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end,
}
return M
