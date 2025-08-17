-- Leader is always space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.o.showmode = false  -- Its already in the status line
vim.wo.relativenumber = true  -- Set relative line numbers
vim.opt.mouse = 'a'  -- Enables mouse in all modes

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true  -- Enable break indent
vim.o.undofile = true  -- Save undo history
vim.o.signcolumn = 'yes'  -- Keep signcolumn on by default

vim.opt.ignorecase = true  -- Makes search case insensitive
vim.opt.smartcase = true  -- Makes the search case-sensitive if I use a capital letter

vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true  -- Highlights as I type
vim.o.inccommand = 'split'  -- Preview substitutions as I type

-- Defines tabs as 2 spaces
vim.opt.expandtab = true  -- Transforms tabs into spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.o.updatetime = 250  -- Decrease update time
vim.o.timeoutlen = 300  -- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.cursorline = true  -- Show which line the cursor is on
vim.o.scrolloff = 10  -- Minimal number of screen lines to keep above and below the cursor.

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if I wish to save the current file(s)
vim.o.confirm = true
