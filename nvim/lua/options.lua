-- Set relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set highlight on search
vim.opt.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Change where split windows are created
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable line wrapping
vim.opt.wrap = false;

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

-- Allow the visual block edit mode to use non existing characters.
vim.opt.virtualedit = 'block'

-- Show the effects of a substitue in a split window.
vim.opt.inccommand = 'split'

-- Enable the cursor line
vim.opt.cursorline = true

-- Allow an 8 line buffer above and below before scrolling the buffer.
vim.opt.scrolloff = 20
