{config, pkgs, ...}:
{
	 programs.rofi = {
    enable = true;
    # Optional: Use a specific package (e.g., for Wayland)
    # package = pkgs.rofi-wayland;
    theme = "~/.cache/wal/colors-rofi-dark.rasi"; # Built-in theme or path to .rasi file
    font = "IosevkaTermSlab Nerd Font 12";
    terminal = "${pkgs.alacritty}/bin/alacritty"; # Set your terminal
    location = "center";
    cycle = true; # Cycle through results
    extraConfig = {
      kb-row-down = "Down";
      kb-row-up = "Up";
    };
  };
}
