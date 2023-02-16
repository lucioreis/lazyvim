return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,
        nls.builtins.diagnostics.flake8,
      },
    }
  end,
}