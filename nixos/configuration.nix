# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/intel-drivers.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nugga"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

   # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # enable intel drivers
  drivers.intel.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = false;

  # Enable sound.
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
     enable = true;
     pulse.enable = true;
 };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.monkey = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  services.gvfs.enable = true;
  services.ollama = {
	enable = true;
	};
  programs.firefox.enable = true;
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	withUWSM  = true;
	};
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     	wget
	git
	alacritty
	wl-clipboard
	rofi-wayland
	nautilus
	gvfs
	swww
	nixfmt-rfc-style
	ollama
	hyprpolkitagent
	wlogout
	swaynotificationcenter
	waybar
	nomacs-qt6
	prismlauncher
	(prismlaucnher.override {
		jdks = [jdk21 jdk22];	
	})
     ];


  # Enable Steam
  programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  	localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

  fonts.packages = with pkgs; [ nerd-fonts.iosevka-term-slab  ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

