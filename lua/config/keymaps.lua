-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
local unmap = vim.keymap.del

-- lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })
-- Press enter to save
map("n", "<cr>", "<cmd>w<cr><esc>", { desc = "Save file" })

map("n", "=", "<cmd>Neotree buffers reveal toggle float<cr>", { desc = "Neotree buffers" })
map("n", "-", "<cmd>Neotree git_status reveal_force_cwd toggle float<cr>", { desc = "Neotree git status" })
map("n", "<leader>e", "<cmd>Neotree filesystem reveal_force_cwd toggle left<cr>", { desc = "Neotree" })
map(
  "n",
  "0",
  "<cmd>Neotree filesystem reveal_force_cwd toggle float<cr>",
  { desc = "Neotree show files in a floating window" }
)
map("n", "n", "nzzzv", { desc = "Next result" })
map("n", "N", "Nzzzv", { desc = "Prev result" })
map("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], { desc = "Open on browser" })
map("n", "q:", "<cmd>Telescope command_history<cr>", { desc = "Command history" })

unmap("n", "<leader>uf")
unmap("n", "<leader>us")
unmap("n", "<leader>uw")
unmap("n", "<leader>ul")
unmap("n", "<leader>ud")
unmap("n", "<leader>uc")

map("n", "<leader>Uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>Us", function()
  Util.toggle("spell")
end, { desc = "Toggle Spelling" })
map("n", "<leader>Uw", function()
  Util.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
map("n", "<leader>Ul", function()
  Util.toggle("relativenumber", true)
  Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
map("n", "<leader>Ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>Uc", function()
  Util.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down", silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down", silent = true })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up", silent = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up", silent = true })
