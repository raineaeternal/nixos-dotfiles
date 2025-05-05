{ pkgs, ...}: {
    programs.gamescope.enable = true;

    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
     	  zip
        unzip
        p7zip
        fflogs
    ];

}
