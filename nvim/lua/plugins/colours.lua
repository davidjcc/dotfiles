return {
    {
        -- -- Theme inspired by Atom
        -- "navarasu/onedark.nvim",
        -- priority = 1000,
        -- lazy = false,
        -- config = function()
        --     require("onedark").setup {
        --         -- Set a style preset. "dark" is default.
        --          -- style = "dark", -- dark, darker, cool, deep, warm, warmer, light
        --     }
        --     require("onedark").load()
        -- end,
    },

    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            filetypes = { "*" },
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue or blue
                RRGGBBAA = false, -- #RRGGBBAA hex codes
                AARRGGBB = false, -- 0xAARRGGBB hex codes
                rgb_fn = false, -- CSS rgb() and rgba() functions
                hsl_fn = false, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = "background", -- Set the display mode.
                -- Available methods are false / true / "normal" / "lsp" / "both"
                -- True is same as normal
                tailwind = false, -- Enable tailwind colors
                -- parsers can contain values used in |user_default_options|
                sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                virtualtext = "■",
                -- update color values even if buffer is not focused
                -- example use: cmp_menu, cmp_docs
                always_update = false
            },
            -- all the sub-options of filetypes apply to buftypes
            buftypes = {},
        }
    },

    {
        "echasnovski/mini.hipatterns",
        config = function()
            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                delay = {
                    text_change = 200,
                    scroll = 50
                },
                highlighters = {
                    -- Highlight standalone "FIXME", "HACK", "TODO", "NOTE"
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    hack  = { pattern = "%f[%w]()HACK()%f[%W]",  group = "MiniHipatternsHack"  },
                    todo  = { pattern = "%f[%w]()TODO()%f[%W]",  group = "MiniHipatternsTodo"  },
                    note  = { pattern = "%f[%w]()NOTE()%f[%W]",  group = "MiniHipatternsNote"  },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    -- hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end
    },

    {
        "RRethy/nvim-base16",
        rtp = "vim/",
        config = function()
            -- vim.cmd.colorscheme "base16-catppuccin-mocha"
            -- vim.cmd.colorscheme "base16-da-one-black"
        end,
        opts = {}
    },



}
