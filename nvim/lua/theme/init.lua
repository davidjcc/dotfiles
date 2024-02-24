
local load_highlight = function(group)
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

local hls = {
  require("theme.theme"),
  require("theme.syntax"),
  require("theme.lsp"),
  require("theme.git"),
  require("theme.treesitter"),
  require("theme.dev-icons"),
  require("theme.nvim-tree"),
  require("theme.telescope"),
  require("theme.mason"),
  require("theme.cmp"),
}

for _, hl in pairs(hls) do
  load_highlight(hl)
end
