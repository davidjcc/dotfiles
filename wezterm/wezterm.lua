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
  default_prog = {"C:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo" },
  -- default_prog = {"wsl", "-d", "Debian" },
  default_cwd = "C:/dev",

  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_max_width = 30,
  window_decorations = "RESIZE",

  debug_key_events = false,
  max_fps = 120,
}

merge_config("colours")
merge_config("font")
merge_config("keymaps")

return config
