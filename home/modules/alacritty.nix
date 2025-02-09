{config, pkgs, ...}:
{
	programs.alacritty.enable = true;
	programs.alacritty.settings = {
		general.import = ["~/.cache/wal/colors-alacritty.toml"];
		font = {
			normal = {family = "IosevkaTermSlab Nerd Font"; style = "Regular";};
			size = 14;
		};	
	};
}
