local map = vim.keymap.set
local M = {
  -- Mason
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "tailwindcss-language-server",
      "typescript-language-server",
      "prisma-language-server",
    },
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neoconf.nvim",
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        keys = { { "<leader>O", "<cmd>Navbuddy<cr>", desc = "Navbuddy" } },
        opts = {
          lsp = { auto_attach = true },
        },
      },
    },

    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = nil, --Deprecated
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overriden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      inlay_hints = { enabled = false },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        jsonls = {},
        tailwindcss = {},
        tsserver = {
          settings = {
            watchOptions = {
              watchFile = "dynamicPriorityPolling",
            },
          },
        },
        cssls = {},
        gopls = {},
        prismals = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          root_dir = function()
            return vim.loop.cwd()
          end,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    init = function()
      local format = require("lazyvim.util").format
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- keys[#keys + 1] = { "K", false }
      -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
      -- disable a keymap
      -- add a keymap
      keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
      keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" }
      keys[#keys + 1] = { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] = { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Goto Definition" }
      keys[#keys + 1] = { "gr", "<cmd>Trouble lsp_references<cr>", desc = "References" }
      keys[#keys + 1] = { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" }
      keys[#keys + 1] = { "gI", "<cmd>Trouble lsp_implementations<cr>", desc = "Goto Implementation" }
      keys[#keys + 1] = { "gt", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Goto Type Definition" }
      keys[#keys + 1] = { "K", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "<leader>k", require("pretty_hover").hover, desc = "Pretty Hover" }
      keys[#keys + 1] = { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
      keys[#keys + 1] =
        { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
      -- keys[#keys + 1] =
      -- { "<leader>lf", require("lazyvim.util").format, desc = "Format Document", has = "documentFormatting" }
      -- keys[#keys + 1] = { "<leader>lf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" }
      keys[#keys + 1] = { "<leader>cR", "<cmd>LspRestart<cr>", desc = "Restart LSP", mode = "n" }
    end,
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {
      border = nil,
    },
  },
}

return M
