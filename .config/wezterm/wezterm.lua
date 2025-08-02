-- wezterm.lua

local wezterm = require("wezterm")

local config = {}

-- In newer versions of Wezterm, use the config object
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set the window background opacity to 0.7
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "zsh", "fish", "tmux" }
config.color_scheme = "Monokai Pro (Gogh)"

-- Check if the current OS is macOS (Darwin)
if wezterm.target_triple:find("darwin") then
	-- macOS-specific settings here
	config.keys = {
		{
			key = "w",
			mods = "CMD",
			action = wizterm.action.CloseCurrentTab({ confirm = false }),
		},
	}
	config.macos_window_background_blur = 20
elseif wezterm.target_triple:find("windows") then
	-- Windows-specific settings here
	config.keys = {
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
	}
	-- Wait until it comes out of nightly build
	-- config.kde_window_background_blur = true

	config.default_domain = "WSL:Ubuntu-20.04"
end

return config
