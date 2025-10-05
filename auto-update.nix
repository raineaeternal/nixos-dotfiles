{ system, ... }: {
    system.autoUpgrade = {
        enable = true;
        operation = "boot";
        flake = "~/Documents/nixos#foxhole";
        flags = [ "--upgrade-all" ];
        dates = "monthly";
    };
}
