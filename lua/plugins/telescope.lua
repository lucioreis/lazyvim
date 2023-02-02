return {
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Find Files",
      },

      {
        "<leader>fo",
        function() require("telescope.builtin").oldfiles() end,
        desc = "Find Recent Files",
      },
      {
        "<leader>ft",
        function() require("telescope.builtin").live_grep(
          require("telescope.themes").get_ivy({winblend = 10})
        ) end,
        desc = "Find Text",
      },
      {
        "<leader>sh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Search Help Tags",
      },
      {
        "<leader>sk",
        function() require("telescope.builtin").keymaps() end,
        desc = "Search Keymaps",
      },
      {
        "<leader>sC",
        function() require("telescope.builtin").colorscheme({enable_preview = true }) end,
        desc = "Search Colorscheme"
      },
      {
        "<leader>sr",
        function() require("telescope.builtin").registers() end,
        desc = "Search Registers"
      },
      {
        "<leader>sc",
        function() require("telescope.builtin").commands() end,
        desc = "Search Commands"
      },
      {
        "<leader>sH",
        function() require("telescope.builtin").highlights() end,
        desc = "Search Highlights"
      },
      {
        "<leader>sM",
        function() require("telescope.builtin").man_pages() end,
        desc = "Search Man Pages"
      },
      {
        "<leader>bb",
        function() require("telescope.builtin").buffers({previewer = false}) end,
        desc = "Find Buffers"
      },
      {
        "<leader>gc",
        function() require("telescope.builtin").git_commits() end,
        desc = "Commits",
      },
      {
        "<leader>gS",
        function() require("telescope.builtin").git_stash() end,
        desc = "Stashes",
      },
      {
        "<leader>gB",
        function() require("telescope.builtin").git_branchs() end,
        desc = "Branches",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "ahmedkhalf/project.nvim",
    ft = "alpha",
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope").extensions.projects.projects({ previewer = false })
        end,
        desc = "Projects",
        mode = "n",
      },
    },
    config = function()
      require("telescope").load_extension("projects")
    end,
  },
}
