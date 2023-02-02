return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = { { "<leader>uu", "<cmd>UndotreeToggle<cr>", mode = "n", desc = "Undotree" } },
  config = function()
    local options = {
      WindowLayout = 3,
      ShortIndicators = 1,
      SplitWidth = 15,
      DiffpanelHeight = 10,
      DiffAutoOpen = 1,
      SetFocusWhenToggle = 1,
      TreeNodeShape = "*",
      TreeVertShape = "|",
      TreeSplitShape = "/",
      TreeReturnShape = "\\",
      DiffCommand = "diff",
      RelativeTimestamp = 1,
      HighlightChangedText = 1,
      HighlightChangedWithSign = 1,
      HighlightSyntaxAdd = "DiffAdd",
      HighlightSyntaxChange = "DiffChange",
      HighlightSyntaxDel = "DiffDelete",
      HelpLine = 1,
      CursorLine = 1,
    }

    for key, value in pairs(options) do
      if not vim.g["undotree_" .. key] then
        vim.g["undotree_" .. key] = value
      end
    end
  end,
}
