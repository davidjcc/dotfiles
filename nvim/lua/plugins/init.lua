return {
    -- Add indentation guides TODO: Make the lines darker.
    -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Fun utility.
    {
        'Eandrju/cellular-automaton.nvim',

        -- Fun utility.
        {
            'Eandrju/cellular-automaton.nvim',
            config = function()
                vim.keymap.set("n", "<leader>fml", "<CMD>CellularAutomaton make_it_rain<CR>")
            end
        },

        config = function()
            vim.keymap.set("n", "<leader>fml", "<CMD>CellularAutomaton make_it_rain<CR>")
        end
    },

    -- Better annotation generator.
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*" 
    },

    -- Search and replace panel
    {
        "nvim-pack/nvim-spectre",
        opts = {
            highlight = {
                search = "SpectreSearch",
                replace = "SpectreReplace",
            },
            mapping = {
                ["send_to_gf"] = {
                    map = "<C-q>",
                    cmd = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
                    desc = "Send all items to quickfix"
                }
            }
        },
        config = function()
            vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {desc = "Toggle [S]pectre"})
            vim.keymap.set('n', '<leader>fw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {desc = "[F]ind current [w]ord in Spectre"})

            vim.keymap.set('v', '<leader>fw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {desc = "[F]ind current [w]ord in Spectre"})
        end
    },

    -- Maximise the split view
    {
        "szw/vim-maximizer",
        config = function()
            vim.keymap.set('n', '<leader>m', "<CMD>:MaximizerToggle<CR>", {desc = "Maximise/Minimise the current split"})
        end

    },


    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            "onsails/lspkind.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            {'folke/neodev.nvim', opts = {}}
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },

    {
        'stevearc/oil.nvim',
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-b>"] = "actions.select_vsplit",
                ["<C-x>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            columns = {
                "icon"
            },
            view_options = {
                show_hidden = true
            },
            float = {
                -- Padding around the floating window
                padding = 2,
                max_width = 150,
                max_height = 40,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                override = function(conf)
                    return conf
                end,
            }
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = "onedark",
                component_separators = '|',
                section_separators = '',
                globalstatus = true,
            }
        },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            }
        },
        opts = {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- Perforce plugin
    'nfvs/vim-perforce',

    -- Smoothscrolling
    'psliwka/vim-smoothie',

    -- Async build
    'tpope/vim-dispatch',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- Git related plugins
    -- 'tpope/vim-fugitive',
    -- 'tpope/vim-rhubarb',
}

