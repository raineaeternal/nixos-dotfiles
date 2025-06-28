{ config, pkgs, ...}: {
    #boot.kernelPackages = pkgs.linuxPackages_cachyos;
    boot.kernelPackages = pkgs.linuxPackages_6_15;
    boot.supportedFilesystems = ["ntfs"];
    
    boot.kernelModules = [
        "ntsync"
    ];

    services.scx.enable = true;
    services.scx.scheduler = "scx_lavd";
    
    security.polkit.enable = true;
}
