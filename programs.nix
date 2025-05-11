{ pkgs, ...}: {
    programs.gamescope.enable = true;

    services.gnome.gnome-keyring.enable = true;

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
     	  zip
        unzip
        p7zip
        fflogs
    ];
}
