{ config, pkgs, ... }:

{
  imports = [ ./modules/gtk.nix ./modules/alacritty.nix ./modules/hyprland.nix ./modules/rofi.nix ./modules/waybar.nix];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "monkey";
  home.homeDirectory = "/home/monkey";
  home.packages = with pkgs; [
	imagemagick
	pywal16
	fastfetch
	pywalfox-native
	gh
	mpv
	];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash = {
	enable = true;
	enableCompletion = true;
   	 # TODO add your custom bashrc here
    	bashrcExtra = ''
      		export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    	'';
	};

  programs.git = {
  	enable = true;
	userEmail = "rushabhpatil@tutamail.com";
	userName = "rushabhp";
  };
}
