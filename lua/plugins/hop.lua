local M = {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  keys = {
    {
      "s",
      function()
        require("hop").hint_words()
      end,
      mode = { "n", "v" },
      desc = "HopWord",
    },
    {
      "f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "v" },
      desc = "Hop Same Line After Cursor",
      silent = true,
    },
    {
      "F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "v" },
      desc = "Hop Same Line Before Cursor",
      silent = true,
    },
    {
      "t",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        })
      end,
      mode = { "n", "v" },
      desc = "Hop Same Line After Cursor",
      silent = true,
    },
    {
      "T",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        })
      end,
      mode = { "n", "v" },
      desc = "Hop Same Line Before Cursor",
      silent = true,
    },
  },

  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  config = function(_, opts)
    require("hop").setup(opts)
  end,
}
return M
