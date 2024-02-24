require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-v>'] = false,
        ['<C-b>'] = 'select_vertical',
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')


