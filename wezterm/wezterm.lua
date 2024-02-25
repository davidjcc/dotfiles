local w = require 'wezterm'
local a = w.action

-- https://hackernoon.com/get-the-most-out-of-your-terminal-a-comprehensive-guide-to-wezterm-configuration

return {
  default_prog = { "powershell", "-NoLogo" },

  freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
  freetype_render_target = "HorizontalLcd",
  freetype_load_target = "HorizontalLcd",
  adjust_window_size_when_changing_font_size = false,
  font = w.font("FiraCode Nerd Font Mono"),
  font_size = 10,
  line_height = 1.0,
  cell_width = 0.9,
  window_frame = {
    font = w.font { family = 'Noto Sans', weight = 'Regular' },
  },

  color_scheme = "tokyonight",
  colors = {
     background = "#0E111D"
  },

  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_max_width = 30,
  window_decorations = "RESIZE",
  enable_scroll_bar = true,

  inactive_pane_hsb = { saturation = 0.9, brightness = 0.6 },  -- s0.9, b0.8

  debug_key_events = false,

    mouse_bindings = { {
        event = { Down = { streak = 3, button = 'Right' } },
        action = a.SelectTextAtMouseCursor 'SemanticZone',
    }, },

  keys = {
    { key = "H", mods = "SHIFT|ALT", action = w.action.SplitHorizontal({domain = "CurrentPaneDomain" }) },
    { key = "V", mods = "SHIFT|ALT", action = w.action.SplitVertical({domain = "CurrentPaneDomain" }) },

    { key = 'l', mods = 'ALT', action = w.action.ActivatePaneDirection("Right")},
    { key = 'h', mods = 'ALT', action = w.action.ActivatePaneDirection("Left")},
    { key = 'k', mods = 'ALT', action = w.action.ActivatePaneDirection("Up")},
    { key = 'j', mods = 'ALT', action = w.action.ActivatePaneDirection("Down")},
  }
}
