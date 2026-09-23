local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local config = wezterm.config_builder()
local is_mac = wezterm.target_triple:find("darwin") ~= nil

---ternary implementation for lua
---@generic T
---@param bool boolean
---@param a T
---@param b T
---@return T
local function ternary(bool, a, b)
	if bool then
		return a
	end
	return b
end

config = {
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	-- adjust_window_size_when_changing_font_size = true,
	window_decorations = "RESIZE",
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font_size = ternary(is_mac, 15, 14),
	enable_tab_bar = false,
	font = wezterm.font("0xProto Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
	background = ternary(is_mac, {
		{ source = {
			Color = "#0F0F21",
		}, width = "100%", height = "100%" },
	}, {}),
}

if is_mac then
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
end

return config
