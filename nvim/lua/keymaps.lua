
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Add keybind for neogen documentation generator.
vim.keymap.set("n", "<Leader>/", ":lua require('neogen').generate()<CR>", {noremap = true, silent = true})

-- Map the split and vsplit
vim.keymap.set('n', "<leader>ss", "<CMD>:split<CR>", { silent = true, desc = "[S]plit the current buffer" })
vim.keymap.set('n', "<leader>vv", "<CMD>:vsplit<CR>", { silent = true, desc = "Split the current buffer [v]ertically"})


-- Remap the visual block keybind as it is already used as the system paste.
-- vim.keymap.set('n', '<A-v>', '<S-v>')
-- vim.keymap.set('n', '<S-v>', '<C-v>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Rotate the split buffers
vim.keymap.set('n', '<leader>rt', "<CMD>wincmd r<CR>", {desc = "[R]ota[t]e the split buffers"})

-- Opens the link under the cursor
vim.keymap.set('n', 'gx', ":!start <cWORD><CR><CR>", {silent = true})

-- Telescope keybinds.
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>th', '<CMD>Telescope colorscheme<CR>', { desc = 'Open the the telescope [th]eme selector' })
vim.keymap.set('n', '<leader>,', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>gg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = '[L]ist all [D]iagnostics in the quick fix list' })

-- Oil keybind
vim.keymap.set('n', '-', require("oil").open_float, { desc = "Toggle the oil window" })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Build using makefile (debug and release)
vim.keymap.set('n', '<leader>bd', '<CMD>:Make debug<CR>', { desc = 'Build debug' })
vim.keymap.set('n', '<leader>br', '<CMD>:Make release<CR>', { desc = 'Build release' })

-- Remap the save and quit
vim.keymap.set('n', '<leader>q', '<CMD>:q<CR>', { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>x', '<CMD>:x<CR>', { desc = 'Save and close the current buffer' })
vim.keymap.set('n', '<leader>w', '<CMD>:w<CR>', { desc = '[W]rite the current buffer' })
vim.keymap.set('n', '<C-s>', '<CMD>:w<CR>', {})

-- Simpler buffer switching.
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Switch to left buffer' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Switch to below buffer' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Switch to above buffer' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Switch to right buffer' })

-- Open the quickfix list
local toggle_qf = require("misc.toggle_quickfix")
vim.api.nvim_create_user_command("ToggleQuickfix", toggle_qf.toggle, {})
vim.keymap.set('n', '<leader>qf', toggle_qf.toggle, { desc = 'Toggle the quickfix window' })

-- Toggle diagnostic
local toggle_diag = require("misc.toggle_diagnostics")
vim.api.nvim_create_user_command("ToggleDiagnostics", toggle_diag.toggle, {})
vim.keymap.set('n', '<leader>td', toggle_diag.toggle, { desc = '[T]oggle [D]iagnostics' })

-- Shift selection (similar to Alt-Up/Down in other editors).
vim.keymap.set("v", "J", ":m '>+1'<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2'<CR>gv=gv")


