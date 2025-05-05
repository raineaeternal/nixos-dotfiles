{ pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        ripgrep
        pciutils
        fish
    ];

    programs.fish.enable = true;
}
