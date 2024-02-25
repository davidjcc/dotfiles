local wezterm = require("wezterm")

return {
  mouse_bindings = {
    {
      event = { Down = { streak = 3, button = 'Right' } },
      action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    },
  },

  keys = {
    { key = "H", mods = "SHIFT|ALT", action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain" }) },
    { key = "V", mods = "SHIFT|ALT", action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain" }) },

    { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Right")},
    { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Left")},
    { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Up")},
    { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Down")},

    { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane({confirm = true})}
  }
}
