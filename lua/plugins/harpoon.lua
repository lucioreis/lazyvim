return {
  "ThePrimeagen/harpoon",
  keys = function()
    vim.keymap.set("n", "<leader>mm", function()
      require("harpoon.mark").toggle_file()
    end, { desc = "Toggle file" })
    vim.keymap.set("n", "<leader>ms", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "Quick Menu" })
    for i = 1, 9 do
      ---@diagnostic disable-next-line: assign-type-mismatch
      vim.keymap.set("n", "<M-" .. i .. ">", function()
        require("harpoon.ui").nav_file(i)
      end, { desc = "Harpoon goto file(" .. i .. ")" })
    end
  end,
  opts = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  },
}
