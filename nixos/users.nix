{pkgs, ... }:

{

  users.users = {
    dennisd = {
      isNormalUser = true;
      description = "Dennis Diekmann";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [];
    };

    private = {
      isNormalUser = true;
      description = "Private Account";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    
    gaming = {
      isNormalUser = true;
      description = "Gaming Account";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

}