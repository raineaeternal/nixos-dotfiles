{ system, ... }: {
    system.autoUpgrade = {
        enable = true;
        operation = "switch";
        flake = "~/Documents/nixos";
        flags = [];
    };
}