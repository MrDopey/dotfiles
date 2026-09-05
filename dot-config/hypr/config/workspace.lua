local config = require("config/__defaults")

local mainModWorkspace = config.mainModWorkspace
local primaryMonitor = config.primaryMonitor
local secondaryMonitor = config.secondaryMonitor
local mainMod = config.mainMod

hl.workspace_rule({ workspace = "1", monitor = primaryMonitor, default = true })
hl.workspace_rule({ workspace = "2", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "3", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "4", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "5", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "6", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "7", monitor = secondaryMonitor, default = true })
hl.workspace_rule({ workspace = "8", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "9", monitor = secondaryMonitor })

hl.workspace_rule({ workspace = "C", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "E", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "M", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "N", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "S", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "T", monitor = primaryMonitor })

hl.bind(
	mainModWorkspace .. " + SHIFT + F",
	hl.dsp.window.fullscreen_state({ action = "toggle", internal = 1, client = 1 }),
	{ desc = "Toggle fullscreen" }
)

hl.bind(
	mainModWorkspace .. " + TAB",
	hl.dsp.focus({ workspace = "previous_per_monitor" }),
	{ desc = "Next window in group" }
)
--
-- MainMod + Shift + H/L/J/K: move window
hl.bind(mainModWorkspace .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }), { desc = "Move window left" })

hl.bind(mainModWorkspace .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }), { desc = "Move window right" })

hl.bind(mainModWorkspace .. " + SHIFT + J", hl.dsp.window.move({ direction = "up" }), { desc = "Move window up" })

hl.bind(mainModWorkspace .. " + SHIFT + K", hl.dsp.window.move({ direction = "down" }), { desc = "Move window down" })

-- Focus
hl.bind(mainModWorkspace .. " + H", hl.dsp.focus({ direction = "left" }), { desc = "Focus left" })

hl.bind(mainModWorkspace .. " + L", hl.dsp.focus({ direction = "right" }), { desc = "Focus right" })

hl.bind(mainModWorkspace .. " + J", hl.dsp.focus({ direction = "up" }), { desc = "Focus up" })

hl.bind(mainModWorkspace .. " + K", hl.dsp.focus({ direction = "down" }), { desc = "Focus down" })

local namedWorkspaces = {
	C = "name:C",
	E = "name:E",
	M = "name:M",
	N = "name:N",
	S = "name:S",
	T = "name:T",
}

for i = 1, 9 do
	-- Move Windows Silently
	hl.bind(
		mainModWorkspace .. " + SHIFT + " .. i,
		hl.dsp.window.move({ workspace = i, follow = false }),
		{ desc = "Move window silently to workspace " .. i }
	)

	-- Workspace Actions
	hl.bind(mainModWorkspace .. " + " .. i, hl.dsp.focus({ workspace = i }), { desc = "Switch to workspace " .. i })
end

for key, workspace in pairs(namedWorkspaces) do
	-- Move Windows Silently
	hl.bind(
		mainModWorkspace .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = workspace, follow = false }),
		{ desc = "Move window silently to workspace " .. key }
	)
	-- Workspace Actions
	hl.bind(
		mainModWorkspace .. " + " .. key,
		hl.dsp.focus({ workspace = workspace }),
		{ desc = "Switch to workspace " .. key }
	)
end

-- Scroll through existing workspaces
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })

hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })

-- ============================================================
-- Window Rules
-- ============================================================

hl.window_rule({ match = { initial_class = "^(discord)$" }, workspace = "name:C" })

hl.window_rule({ match = { initial_class = "^(com.discordapp.Discord)$" }, workspace = "name:C" })

-- Explorer
hl.window_rule({ match = { initial_class = "^(org.kde.dolphin)$" }, workspace = "name:E" })

hl.window_rule({ match = { initial_class = "^(thunar)$" }, workspace = "name:E" })

-- Mail
hl.window_rule({ match = { initial_class = "^(eu.betterbird.Betterbird)$" }, workspace = "name:M" })

-- Notes
hl.window_rule({ match = { initial_class = "^(obsidian)$" }, workspace = "name:N" })

hl.window_rule({ match = { initial_class = "^(Logseq)$" }, workspace = "name:N" })

-- Streaming
hl.window_rule({ match = { initial_class = "^(Spotify)$" }, workspace = "name:S" })

hl.window_rule({ match = { initial_class = "^(spotify)$" }, workspace = "name:S" })

-- Terminal
hl.window_rule({ match = { initial_class = "^(org.wezfurlong.wezterm)$" }, workspace = "name:T" })

-- ============================================================
-- Bind Settings
-- ============================================================

hl.config({
	binds = {
		allow_workspace_cycles = true,
		workspace_back_and_forth = false,
		workspace_center_on = 1,
		movefocus_cycles_fullscreen = true,
		window_direction_monitor_fallback = true,
	},
})
