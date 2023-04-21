return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
          sources = {
              nls.builtins.formatting.prettierd,
              nls.builtins.formatting.stylua,
              nls.builtins.diagnostics.eslint_d.with({
                  method = nls.methods.DIAGNOSTICS_ON_SAVE,
                  diagnostic_config = { --see:help vim.diagnostic.config()
                      underline = true,
                      virtual_text = true,
                      signs = true,
                      update_in_insert = false,
                      severity_sort = true,
                  },
              }),
              nls.builtins.code_actions.eslint_d,
              nls.builtins.diagnostics.flake8,
              -- require("typescript.extensions.null-ls.code-actions"),
          },
      }
    end,
}
