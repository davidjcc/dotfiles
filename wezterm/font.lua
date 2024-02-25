local w = require("wezterm")

local config = w.config_builder()

config.freetype_load_flags = "NO_HINTING|NO_AUTOHINT"
config.freetype_render_target = "HorizontalLcd"
config.freetype_load_target = "HorizontalLcd"
config.adjust_window_size_when_changing_font_size = false
config.font = w.font("FiraCode Nerd Font Mono")
config.font_size = 10
config.line_height = 1.0
config.cell_width = 0.9
config.window_frame = {
  font = w.font {
    family = 'Noto Sans',
    weight = 'Regular'
  },
}

return config
