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
    init = function()
      local format = require("lazyvim.plugins.lsp.format").format
      local rename = require("lazyvim.plugins.lsp.keymaps").rename
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- keys[#keys + 1] = { "K", false }
      -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
      -- disable a keymap
      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
      keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" }
      keys[#keys + 1] = { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] = { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Goto Definition" }
      keys[#keys + 1] = { "gr", "<cmd>Trouble lsp_references<cr>", desc = "References" }
      keys[#keys + 1] = { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" }
      keys[#keys + 1] = { "gI", "<cmd>Trouble lsp_implementations<cr>", desc = "Goto Implementation" }
      keys[#keys + 1] = { "gt", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Goto Type Definition" }
      keys[#keys + 1] = { "K", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
      keys[#keys + 1] =
        { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] = { "<leader>lf", format, desc = "Format Document", has = "documentFormatting" }
      keys[#keys + 1] = { "<leader>lf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>lr",
          function()
            require("inc_rename")
            return ":IncRename " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end
    end,
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = false,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overriden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        jsonls = {},
        tailwindcss = {},
        tsserver = {},
        cssls = {},
        prismals = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
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
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}

return M
