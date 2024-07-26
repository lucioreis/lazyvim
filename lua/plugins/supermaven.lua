return {
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  opts = {
    keymaps = {
      accept_suggestion = "<C-l>",
      clear_suggestion = "<C-h>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = { cpp = true, go = true },
    color = {
      suggestion_color = "#ffffff",
      cterm = 244,
    },

    disable_inline_completion = true, -- disables inline completion for use with cmp
    suggestions_start_disabled = true,
    disable_keymaps = true, -- disables built in keymaps for more manual control
  },
}
