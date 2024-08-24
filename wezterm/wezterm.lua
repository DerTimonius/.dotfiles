local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	-- adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font_size = 16,
	enable_tab_bar = false,
	font = wezterm.font("MonaspiceAr Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
}

return config
