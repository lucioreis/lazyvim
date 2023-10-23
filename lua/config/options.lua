-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local default_options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 0, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true, -- set the title of window to the value of the titlestring
  -- titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
  -- undodir = , -- set an undo directory
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 3, -- the number of spaces inserted for each indentation
  tabstop = 3, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  numberwidth = 3, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  -- shadafile = join_paths(get_cache_dir(), "lvim.shada"),
  scrolloff = 6, -- minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 6, -- minimal number of screen lines to keep left and right of the cursor.
  showcmd = false,
  ruler = false,
  laststatus = 3,
}

for k, v in pairs(default_options) do
  vim.opt[k] = v
end

vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-") -- Consider words separated by '-' as one word
vim.opt.fillchars:append("diff:╱")
vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- turn off auto formatting of paragraphs
  - "t" -- Auto-wrap text using 'textwidth': nope
  + "c" -- Auto-wrap comments using 'textwidtAuto-wrap comments using 'textwidth': nope
  + "r" -- keep the comments going on enter
  - "o" -- Automatically insert the coment leader after hitting o: nope
  + "n" -- Make ident lists great again
  - "2" -- I could'n care less
  + "1" -- Don't brake a line after a one-letter word
  + "p" -- Don't break 'Mr.' and 'Feyman!'
  + "q"

vim.filetype.add({
  extension = {
    tex = "tex",
    zir = "zir",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
  },
})
vim.g.autoformat = false
