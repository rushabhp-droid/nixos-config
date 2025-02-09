{config, pkgs, ...}:
{
	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.systemd.enable = false;
	wayland.windowManager.hyprland.systemd.variables = ["--all"];
	wayland.windowManager.hyprland.settings = {
		source = "~/.cache/wal/colors-hyprland.conf";
		"monitor" = "eDP-1,1920x1080@60,0x0,1";
		exec-once = [ "swww-daemon" "swaync" "waybar" ];
		general = {
			gaps_in = 5;
			gaps_out = 10;
			border_size = 2;
			"col.active_border" = "$color11 rgba(59595900) $color14 45deg";
			"col.inactive_border" = "rgba(59595900)";
		};
		decoration = {
			rounding = 10;
			active_opacity = 1.0;
			inactive_opacity = 1.0;
			blur = {
				enabled = true;
        			size = 3;
        			passes = 3;
				vibrancy = 0.1696;
    				};
		};
		animations = {
			enabled = true;
			bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
			animation = [
				"windows, 1, 7, myBezier"
				"windowsOut, 1, 7, default, popin 80%"
				"border, 1, 10, default"
				"borderangle, 1, 8, default"
				"fade, 1, 7, default"
				"workspaces, 1, 6, default"
			];
		};
		"$mainMod" = "SUPER";
		bindm = [
   			 # mouse movements
		    	"$mainMod, mouse:272, movewindow"
    			"$mainMod, mouse:273, resizewindow"
	    		"$mainMod ALT, mouse:272, resizewindow"
  			];
		bind = [
			"$mainMod, Q, exec, alacritty"
			"$mainMod, L, exec, wlogout"
			"$mainMod, F, fullscreen,"
			"$mainMod, C, killactive,"
			"$mainMod, M, exit,"
			"$mainMod, E, exec, nautilus"
			"$mainMod, V, togglefloating,"
			"$mainMod, R, exec, rofi -show drun"
			"$mainMod, P, pseudo, # dwindle"
			"$mainMod, J, togglesplit, # dwindle"
			"$mainMod, left, movefocus, l"
			"$mainMod, right, movefocus, r"
			"$mainMod, up, movefocus, u"
			"$mainMod, down, movefocus, d"
			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"
			"$mainMod SHIFT, 1, movetoworkspace, 1"
			"$mainMod SHIFT, 2, movetoworkspace, 2"
			"$mainMod SHIFT, 3, movetoworkspace, 3"
			"$mainMod SHIFT, 4, movetoworkspace, 4"
			"$mainMod SHIFT, 5, movetoworkspace, 5"
			"$mainMod SHIFT, 6, movetoworkspace, 6"
			"$mainMod SHIFT, 7, movetoworkspace, 7"
			"$mainMod SHIFT, 8, movetoworkspace, 8"
			"$mainMod SHIFT, 9, movetoworkspace, 9"
			"$mainMod SHIFT, 0, movetoworkspace, 10"
		];
		bindel = [
			",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
			",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];
		bindl = [
			", XF86AudioNext, exec, playerctl next"
			", XF86AudioPause, exec, playerctl play-pause"
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
		];
		windowrulev2 = [
			"float,class:^(.blueman-manager-wrapped)$,title:^(Bluetooth Devices)$"
		];
		misc = {
			force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
			disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
		};
	};	
}
