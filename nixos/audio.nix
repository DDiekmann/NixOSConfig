{pkgs, ...}:

{
    sound.enable = true;
    services.pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
        ffmpeg
    ];
}