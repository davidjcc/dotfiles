local wezterm = require("wezterm")

return {
  mouse_bindings = {
    {
      event = { Down = { streak = 3, button = 'Right' } },
      action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    },
  },

  keys = {
    -- Pane creation
    { key = "H", mods = "SHIFT|ALT", action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain" }) },
    { key = "V", mods = "SHIFT|ALT", action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain" }) },

    -- Pane navigation
    { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Right")},
    { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Left")},
    { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Up")},
    { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection("Down")},

    -- Pane resize
    { key = 'l', mods = 'CTRL|ALT|SHIFT', action = wezterm.action.AdjustPaneSize({"Right", 3})},
    { key = 'h', mods = 'CTRL|ALT|SHIFT', action = wezterm.action.AdjustPaneSize({"Left", 3})},
    { key = 'k', mods = 'CTRL|ALT|SHIFT', action = wezterm.action.AdjustPaneSize({"Up", 3})},
    { key = 'j', mods = 'CTRL|ALT|SHIFT', action = wezterm.action.AdjustPaneSize({"Down", 3})},

    { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane({confirm = true})}
  }
}
