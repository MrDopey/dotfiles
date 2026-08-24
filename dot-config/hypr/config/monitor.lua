-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local config = require("config/__defaults")

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = config.primaryMonitor,
	mode = "2560x1440@99.95Hz",
	position = "0x0",
	scale = "1",
})

-- tranform:1 = 90degrees
--monitor = DP-1, 2560x1440@59.95Hz, 2560x-500, 1, transform, 1

--If you need to scale things like steam etc, please uncomment these lines.
--wayland {
-- force_zero_scaling = true       # Unscale XWayland
--

--Adjust GDK_SCALE accordingly to your liking.
--nv = GDK_SCALE, 1.25                   # GDK Scaling Factor
