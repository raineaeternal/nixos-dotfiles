{ system, ... }: {
    system.autoUpgrade = {
        enable = true;
        operation = "switch";
        flake = "~/Documents/nixos";
        flags = [ "--upgrade-all" ];
        dates = "weekly";
    };
}
