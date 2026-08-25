-- ~/.config/hypr/keybinds.lua
--
-- Hyprland 0.55+
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local config = require("config/__defaults")

local mainMod = config.mainMod

-- ============================================================
-- Basic
-- ============================================================

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(config.filemanager), { desc = "Open file manager" })

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { desc = "Close current window" })

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating" })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(config.applauncher), { desc = "Open application launcher" })

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { desc = "Toggle split mode" })

-- ============================================================
-- Screenshots
-- ============================================================

hl.bind("print", hl.dsp.exec_cmd(config.shotRegion), { desc = "screenshot region" })

hl.bind("CTRL + Print", hl.dsp.exec_cmd(config.shotWindow), { desc = "Screenshot active window" })

hl.bind("ALT + Print", hl.dsp.exec_cmd(config.shotScreen), { desc = "Screenshot active display" })

-- ============================================================
-- Volume Control
-- ============================================================

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"pactl set-sink-volume @DEFAULT_SINK@ +5% && "
			.. "pactl get-sink-volume @DEFAULT_SINK@ | "
			.. 'grep -oP "\\d+(?=%)" | '
			.. "awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && "
			.. "pactl get-sink-volume @DEFAULT_SINK@ | "
			.. 'grep -oP "\\d+(?=%)" | '
			.. "awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{
		desc = "Raise volume",
		repeating = true,
	}
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"pactl set-sink-volume @DEFAULT_SINK@ -5% && "
			.. "pactl get-sink-volume @DEFAULT_SINK@ | "
			.. 'grep -oP "\\d+(?=%)" | '
			.. "awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{
		desc = "Lower volume",
		repeating = true,
	}
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(
		"amixer sset Master toggle | "
			.. "sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; "
			.. "/\\[off\\]/ s/.*/0/p' | "
			.. "head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{
		desc = "Mute player audio",
		repeating = true,
	}
)

-- ============================================================
-- Playback Control
-- ============================================================

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { desc = "Toggle play/pause" })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { desc = "Next track" })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { desc = "Previous track" })

-- ============================================================
-- Screen Brightness
-- ============================================================

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), {
	desc = "Increase brightness",
	repeating = true,
})

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), {
	desc = "Decrease brightness",
	repeating = true,
})

-- ============================================================
-- Lock
-- ============================================================

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(config.lockcmd), { desc = "Lock screen" })

-- ============================================================
-- Window Actions
-- ============================================================

-- MainMod + LMB: drag window
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
	desc = "Move window",
	mouse = true,
})

-- ============================================================
-- Resize Submap
-- ============================================================

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), { desc = "Enter resize mode" })

hl.define_submap("resize", function()
	-- Arrow keys
	hl.bind("right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), {
		desc = "Resize right",
		repeating = true,
	})

	hl.bind("left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), {
		desc = "Resize left",
		repeating = true,
	})

	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), {
		desc = "Resize up",
		repeating = true,
	})

	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), {
		desc = "Resize down",
		repeating = true,
	})

	-- Vim keys
	hl.bind("L", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), {
		desc = "Resize right",
		repeating = true,
	})

	hl.bind("H", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), {
		desc = "Resize left",
		repeating = true,
	})

	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), {
		desc = "Resize up",
		repeating = true,
	})

	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), {
		desc = "Resize down",
		repeating = true,
	})

	hl.bind("ESCAPE", hl.dsp.submap("reset"), { desc = "Exit resize mode" })
end)

-- ============================================================
-- Quick Resize
-- ============================================================

local resize = {
	right = { x = 15, y = 0 },
	L = { x = 15, y = 0 },
	left = { x = -15, y = 0 },
	H = { x = -15, y = 0 },
	up = { x = 0, y = -15 },
	K = { x = 0, y = -15 },
	down = { x = 0, y = 15 },
	J = { x = 0, y = 15 },
}

for key, delta in pairs(resize) do
	hl.bind(
		mainMod .. " + CTRL + SHIFT + " .. key,
		hl.dsp.window.resize({
			x = delta.x,
			y = delta.y,
			relative = true,
		}),
		{
			desc = "Resize " .. key,
			repeating = true,
		}
	)
end

-- ============================================================
-- Mouse Resize
-- ============================================================

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
	desc = "Resize window",
	mouse = true,
})
