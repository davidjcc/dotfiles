local wezterm = require("wezterm")

return {
  font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  font_size = 9,
  adjust_window_size_when_changing_font_size = false,
  line_height = 1.0,
  cell_width = 1.0,
}

