return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
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
}
