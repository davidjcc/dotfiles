local wezterm = require("wezterm")

return {
  font = wezterm.font("FiraCode Nerd Font Mono"),

  freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
  freetype_render_target = "HorizontalLcd",
  freetype_load_target = "HorizontalLcd",
  adjust_window_size_when_changing_font_size = false,

  font_size = 10,
  line_height = 1.0,
  cell_width = 1.0,
  window_frame = {
    font = wezterm.font {
      family = 'Noto Sans',
      weight = 'Regular'
    },
  }
}

