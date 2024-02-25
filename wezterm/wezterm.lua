local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- https://hackernoon.com/get-the-most-out-of-your-terminal-a-comprehensive-guide-to-wezterm-configuration

--- Merge the module passed in to the current config table.
---@class the module name to merge.
local merge_config = function(module)
  local local_config = require(module)
  for key, _ in pairs(local_config) do
    config[key] = local_config[key]
  end
end

config = {
  default_prog = { "powershell", "-NoLogo" },

  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_max_width = 30,
  window_decorations = "RESIZE",

  -- debug_key_events = true,
}

merge_config("colours")
merge_config("font")
merge_config("keymaps")

return config
