-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local _general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "DressingSelect",
    "qf",
    "help",
    "man",
    "vim",
    "lspinfo",
    "fzf",
    "bookmarks",
    "toggleterm",
    "Neogit*",
    "Telescope*",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close!<cr>", { noremap = true, silent = true, buffer = 0 })
  end,
  group = _general_settings,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
  group = _general_settings,
})

vim.api.nvim_create_autocmd("InsertLeavePre", {
  callback = function()
    vim.opt.relativenumber = true
  end,
  group = _general_settings,
})

local _auto_resize = vim.api.nvim_create_augroup("_auto_resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", { command = "tabdo wincmd =", group = _auto_resize })
