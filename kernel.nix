{ config, pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_cachyos;
    #boot.kernelPackages = pkgs.linuxPackages_6_15;
    boot.supportedFilesystems = ["ntfs"];

    boot.kernelModules = [
        "ntsync"
    ];

    security.polkit.enable = true;
}
