return {
  {
    "p00f/nvim-ts-rainbow",
    event = "BufReadPost",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPost",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          -- Languages that have a single comment style
          typescript = "// %s",
          css = "/* %s */",
          scss = "/* %s */",
          html = "<!-- %s -->",
          svelte = "<!-- %s -->",
          vue = "<!-- %s -->",
          json = "",
        },
      },
      indent = { enable = true, disable = { "yaml", "python" } },
      autotag = { enable = true },
      textobjects = {

        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
      textsubjects = {
        enable = false,
        keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
      },
      playground = {
        enable = false,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      rainbow = {
        enable = true,
        extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        disable = { "jsx", "html", "typescriptreact" }, -- list of languages you want to disable the plugin for
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = { "#ff0000", "#ffa500", "#ffff00", "#76ff03", "#0000ff", "#fa0786", "#ee82ee" }, -- table of hex strings
      },
    },
  },
}
