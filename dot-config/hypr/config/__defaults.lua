-- make sure this file is sorted alphabetically first
-- so it's values are loaded before other lua files when globbing

return {
	-- General
	filemanager = "thunar",
	applauncher = "wofi",
	terminal = "wezterm",
	-- Screenshots
	shotRegion = "grimblast --notify copysave area",
	shotWindow = "grimblast --notify copysave active",
	shotScreen = "grimblast --notify copysave output",
	-- Also in hypridle
	lockcmd = "swaylock --ignore-empty-password --hide-keyboard-layout",
	-- a
	primaryMonitor = "desc:Dell Inc. DELL S2725DS 7VQ0X14",
	secondaryMonitor = "",
	-- mods
	mainMod = "SUPER",
	mainModWorkspace = "ALT",
	-- color
	cachylgreen = "rgba(82dcccff)",
	cachymgreen = "rgba(00aa84ff)",
	cachydgreen = "rgba(007d6fff)",
	cachylblue = "rgba(01ccffff)",
	cachymblue = "rgba(182545ff)",
	cachydblue = "rgba(111826ff)",
	cachywhite = "rgba(ffffffff)",
	cachygray = "rgba(798bb2ff)",
	cachygrey = "rgba(ddddddff)",
}
