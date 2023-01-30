local map = vim.keymap.set
return {
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
    keys[#keys + 1] = { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" }
    keys[#keys + 1] = { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" }
    keys[#keys + 1] = { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" }
    keys[#keys + 1] = { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" }
    keys[#keys + 1] = { "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" }
    keys[#keys + 1] = { "K", vim.lsp.buf.hover, desc = "Hover" }
    keys[#keys + 1] = { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] =
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] =
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    keys[#keys + 1] = { "<leader>lf", format, desc = "Format Document", has = "documentFormatting" }
    keys[#keys + 1] = { "<leader>lf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" }
    keys[#keys + 1] = { "<leader>lr", rename, expr = true, desc = "Rename", has = "rename" }
  end,
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    },
    -- Automatically format on save
    autoformat = true,
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
      sumneko_lua = {
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
    },
  },
}
