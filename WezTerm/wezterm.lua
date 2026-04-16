local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font_size = 12
config.color_scheme = 'Dracula'
--[[ config.tab_bar_at_bottom = true ]]
config.enable_tab_bar = false
config.background = {
	{
		source = {
			File =  "/home/aksell/Documents/Wallpapers/Anime/Idols/wallhaven-3l26qd.jpg"
		},
		hsb = {
			brightness = 0.1
		}
	},
}
return config
