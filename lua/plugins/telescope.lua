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
        function() require("telescope.builtin").find_files({
             layout_strategy='vertical',
             layout_config={width=0.5},
             mode="normal",
           }) end,
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
        "<leader>bf",
         function()
           require("telescope.builtin").buffers({
             layout_strategy='vertical',
             layout_config={width=0.5},
             mode="normal",
           })
         end,
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
    opts = function(_, opts)
      local ok, actions = pcall(require, "telescope.actions")
      if not ok then
        return opts
      end
      opts = vim.tbl_deep_extend("force", opts, {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["q"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
          path_display = { "smart" },
          set_env = { ["COLORTERM"] = "truecolor" },
        },
        pickers = {
          live_grep = {
            --@usage don't include the filename in the search results
            only_sort_text = true,
          },
          buffers = {
            initial_mode = "normal",
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,
              },
              n = {
                ["dd"] = actions.delete_buffer,
              },
            },
          },
        },
      })
      return opts
    end,
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
      opts = {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
      },
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
