{ ... }:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
    };

    networking.firewall = {
        allowedTCPPorts = [ 24642 ]; # Open port for Stardew Valley
        allowedUDPPorts = [ ];
    };
}