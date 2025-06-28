{ pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        ripgrep
        pciutils
        fish
    ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    programs.fish.enable = true;
}
