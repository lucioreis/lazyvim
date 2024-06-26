if true then
  return {}
end
local binary_name = "oxlint"
local severities = {
  vim.diagnostic.severity.WARN,
  vim.diagnostic.severity.ERROR,
}

require("lint").linters.oxlint = {
  name = "oxlint",
  cmd = "./node_modules/.bin/oxlint",
  args = {
    "--format",
    "json",
    "--stdin",
    "--stdin-filename",
    function()
      return vim.api.nvim_buf_get_name(0)
    end,
  },
  stdin = true,
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output, bufnr)
    if vim.trim(output) == "" then
      return {}
    end
    local decode_opts = { luanil = { object = true, array = true } }
    local ok, data = pcall(vim.json.decode, output, decode_opts)
    if not ok then
      return {
        {
          bufnr = bufnr,
          lnum = 0,
          col = 0,
          message = "Could not parse linter output due to: " .. data .. "\noutput: " .. output,
        },
      }
    end
    -- See https://eslint.org/docs/latest/use/formatters/#json
    local diagnostics = {}
    for _, result in ipairs(data or {}) do
      for _, msg in ipairs(result.messages or {}) do
        table.insert(diagnostics, {
          lnum = msg.line and (msg.line - 1) or 0,
          end_lnum = msg.endLine and (msg.endLine - 1) or nil,
          col = msg.column and (msg.column - 1) or 0,
          end_col = msg.endColumn and (msg.endColumn - 1) or nil,
          message = msg.message,
          code = msg.ruleId,
          severity = severities[msg.severity],
          source = binary_name,
        })
      end
    end
    return diagnostics
  end,
}

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      typescriptreact = { "oxlint" },
      typescript = { "oxlint" },
      javascript = { "oxlint" },
    },
  },
}
