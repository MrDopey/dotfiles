-- wezterm.lua

local wezterm = require("wezterm")

local config = {}

-- In newer versions of Wezterm, use the config object
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set the window background opacity to 0.7
config.window_background_opacity = 0.80
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "zsh", "fish", "tmux" }
config.color_scheme = "Monokai Remastered"

local cmdMod = ""
local everythingMod = ""

-- Check if the current OS is macOS (Darwin)
if wezterm.target_triple:find("darwin") then
	-- macOS-specific settings here
	cmdMod = "CMD"
	everythingMod = "CMD|SHIFT"
	config.macos_window_background_blur = 20
	config.font_size = 15
elseif wezterm.target_triple:find("windows") then
	-- Windows-specific settings here
	cmdMod = "CTRL"
	everythingMod = "CTRL|SHIFT|ALT"
	config.default_domain = "WSL:Ubuntu-20.04"
	-- Wait until it comes out of nightly build
	-- config.kde_window_background_blur = true
end

config.keys = {
	{
		key = "w",
		mods = cmdMod,
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "|",
		mods = everythingMod,
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = everythingMod,
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
return config
