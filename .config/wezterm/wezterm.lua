-- wezterm.lua

local wezterm = require("wezterm")

local config = {}

-- create a function to concatenate tables
-- https://www.tutorialspoint.com/lua/lua_merge_tables.htm
function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

-- In newer versions of Wezterm, use the config object
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set the window background opacity to 0.7
config.window_background_opacity = 0.80
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "zsh", "fish", "tmux" }
config.color_scheme = "Monokai Remastered"

config.quick_select_patterns = {
	-- Everything inside ( ), ensure pairing and doesn't fall off the edge
	[[(?<=\()[^\)]+(?=\))]],
	-- Everything inside [ ]
	[[(?<=\[)[^])]+(?=\])]],
	-- Everything inside " "
	[[(?<=")[^"]+(?=")]],
	-- Everything inside ' '
	[[(?<=')[^']+(?=')]],

	-- Docker image names
	-- letters, numbers, -, / _
	"(?<=\\s\\s)[a-zA-Z0-9-\\/_]+",
	-- Docker image tags
	-- letters, numbers, -, / _ .
	"(?<=:)[a-zA-Z0-9-\\/_\\.]+",
}

local cmdMod = ""
local everythingMod = ""
local extraKeys = {}

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
elseif wezterm.target_triple:find("linux") then
	cmdMod = "SUPER"
	everythingMod = "SUPER|SHIFT"
end

if wezterm.target_triple:find("darwin") or wezterm.target_triple:find("linux") then
	extraKeys = TableConcat(extraKeys, {
		-- https://github.com/wezterm/wezterm/issues/253
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
		-- Make alt + del, delete a word
		{ key = "Delete", mods = "OPT", action = wezterm.action({ SendString = "\x1bd" }) },
	})
end

local other_keys = {
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

config.keys = TableConcat(extraKeys, other_keys)

return config
