{pkgs, lib, config, ...}:

{
    options = {
		thunderbird.enable = lib.mkEnableOption "Enable thunderbird";
	};

    config = lib.mkIf config.thunderbird.enable {
        # Enable the thunderbird mail client
        home.packages = [
            pkgs.thunderbird
        ];
    };
}