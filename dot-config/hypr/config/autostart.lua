-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("mako")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd(
		'bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob"'
	)
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

	-- Slow app launch fix
	hl.exec_cmd("systemctl --user import-environment")
	hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null")
	hl.exec_cmd("dbus-update-activation-environment --systemd")

	-- Idle configuration
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
end)
