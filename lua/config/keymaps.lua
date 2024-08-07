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

--Toggle terminal
unmap("n", "<leader>fT")
unmap("n", "<C-B>")
unmap("n", "<C-F>")
map("n", "<leader>tt", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal" })
map("n", "<leader>tT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("n", "<leader>tn", function()
  Util.float_term("node", { cwd = Util.get_root() })
end, { desc = "Node" })
map("n", "<leader>tb", function()
  Util.float_term("btop", { cwd = Util.get_root() })
end, { desc = "BTop" })
map("n", "<leader>tg", function()
  Util.float_term("lazygit", { cwd = Util.get_root() })
end, { desc = "LazyGit" })
map("n", "<leader>td", function()
  Util.float_term("lazydocker", { cwd = Util.get_root() })
end, { desc = "LazyDocker" })
map("n", "<leader>tr", function()
  Util.float_term("ranger", { cwd = Util.get_root() })
end, { desc = "Ranger" })

-- lazy
unmap("n", "<leader>l")
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })
-- Press enter to save
map("n", "<cr>", "<cmd>w<cr><esc>", { desc = "Save file" })

map("n", "=", "<cmd>Neotree buffers reveal toggle float<cr>", { desc = "Neotree buffers" })
map("n", "-", "<cmd>Neotree git_status reveal_force_cwd toggle float<cr>", { desc = "Neotree git status" })
map("n", "<leader>e", "<cmd>Neotree filesystem reveal_force_cwd left toggle<cr>", { desc = "Neotree" })
map(
  "n",
  "0",
  "<cmd>Neotree filesystem reveal_force_cwd toggle float<cr>",
  { desc = "Neotree show files in a floating window" }
)
map("n", "<Space>ur", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", { desc = "No highlight" })
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

-- map("n", "<leader>Uf", require("lazyvim.util").format, { desc = "Toggle format on Save" })
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
-- map("n", "<leader>Ud", require("lazyvim.util").toggle, { desc = "Toggle Diagnostics" })
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
map("n", "<leader>at", "<cmd>SupermavenToggle<CR>", { desc = "Toggle Supermaven", silent = true })
map("n", "<leader>as", "<cmd>SupermavenStop<CR>", { desc = "Stop Supermaven", silent = true })
map("n", "<leader>aS", "<cmd>SupermavenStart<CR>", { desc = "Start Supermaven", silent = true })
map("n", "<leader>ar", "<cmd>SupermavenRestart<CR>", { desc = "Restart Supermaven", silent = true })
map("n", "<leader>aI", "<cmd>SupermavenStatus<CR>", { desc = "Status Supermaven", silent = true })
map("n", "<leader>aL", "<cmd>SupermavenShowLog<CR>", { desc = "Show Supermaven Log", silent = true })
map("n", "<leader>aC", "<cmd>SupermavenClearLog<CR>", { desc = "Clear Supermaven Log", silent = true })

map("n", "H", "_")
map("n", "L", "$")
-- map("i", "1", "(")
-- map("i", "0", ")")
-- map("i", "2", "[")
-- map("i", "9", "]")
-- map("i", "3", "{")
-- map("i", "8", "}")
-- map("i", "4", "<")
-- map("i", "7", ">")
