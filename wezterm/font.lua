local wezterm = require("wezterm")

return {
  -- font = wezterm.font("JetBrains Mono", { weight = "Regular" }),
  font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" }),
  font_antialiasing = "Greyscale",
  font_hinting = "None",
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  font_size = 9.0,
  adjust_window_size_when_changing_font_size = false,
  line_height = 1.0,
  cell_width = 1.0,
}

