{config, pkgs, ...}:
{
	programs.waybar.enable = true;
	programs.waybar.settings = {
		mainBar = {
			layer = "top";
			position = "top";
			spacing = 10;
			padding = 15;
			height = 40;
			output = [ "eDP-1" ];
			modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
    			modules-center = [ "hyprland/window" ];
    			modules-right = [ "tray" "pulseaudio" "battery" "clock" ];
		};

		"battery" = {
			"bat"= "BAT0";
        		"format"= "{capacity}% {icon}";
        		"format-icons"= ["" "" "" "" ""];
		};
	};


	programs.waybar.style = ''
		* {
		border: 0;
	    	border-radius: 0px;
    		font-family: "IosevkaTermSlab Nerd Font";
    		font-size: 14px;
    		min-height: 0;
    		border-radius: 0px;
    		font-weight: 900;
		}
	'';
}
