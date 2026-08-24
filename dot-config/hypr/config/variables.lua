local config = require("config/__defaults")

local cachylgreen = config.cachylgreen
local cachymgreen = config.cachymgreen
local cachydgreen = config.cachydgreen
-- local cachylblue = config.cachylblue
local cachymblue = config.cachymblue
local cachydblue = config.cachydblue
-- local cachywhite = config.cachywhite
-- local cachygray = config.cachygray
-- local cachygrey = config.cachygrey

-- ============================================================
-- General
-- ============================================================

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 3,

		col = {
			active_border = cachylgreen,
			inactive_border = cachymblue,
		},

		layout = "dwindle",

		snap = {
			enabled = true,
		},
	},
})

-- ============================================================
-- Gestures
-- ============================================================

hl.config({
	gestures = {
		workspace_swipe_distance = 250,
		workspace_swipe_min_speed_to_force = 15,
		workspace_swipe_create_new = false,
	},
})

-- ============================================================
-- Groups
-- ============================================================

hl.config({
	group = {
		col = {
			border_active = cachydgreen,
			border_inactive = cachylgreen,
			border_locked_active = cachymgreen,
			border_locked_inactive = cachydblue,
		},

		groupbar = {
			font_family = "Fira Sans",
			text_color = cachydblue,

			col = {
				active = cachydgreen,
				inactive = cachylgreen,
				locked_active = cachymgreen,
				locked_inactive = cachydblue,
			},
		},
	},
})

-- ============================================================
-- Miscellaneous
-- ============================================================

hl.config({
	misc = {
		font_family = "Fira Sans",
		splash_font_family = "Fira Sans",

		disable_hyprland_logo = true,

		col = {
			splash = cachylgreen,
		},

		background_color = cachydblue,

		enable_swallow = true,
		swallow_regex = "^(firefox|nautilus|nemo|thunar|btrfs-assistant.)$",

		focus_on_activate = true,

		vrr = 2,
	},
})

-- ============================================================
-- Rendering
-- ============================================================

hl.config({ render = { direct_scanout = true } })

-- ============================================================
-- Dwindle Layout
-- ============================================================

hl.config({ dwindle = { special_scale_factor = 0.8, preserve_split = true } })

-- ============================================================
-- Master Layout
-- ============================================================

hl.config({ master = { new_status = "master", special_scale_factor = 0.8 } })
