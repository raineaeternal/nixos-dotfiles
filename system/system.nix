{ config, nix, pkgs, ... }: {
    # Nix settings;
    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];
    # System configuration;
    # Boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    # boot.timeout = 2;
    boot.initrd.enable = true;
    boot.initrd.systemd.enable = true;
    boot.supportedFilesystems = ["ntfs"];

    # Network
    networking.networkmanager.enable = true;
    networking.hostName = "foxhole";

    # Time
    time.timeZone = "Europe/Oslo";

    # Localization
    i18n.defaultLocale = "en_GB.UTF-8";

    # X11/KDE
    services.xserver.enable = true;

    # X11 Keyboard
    services.xserver.xkb = {
        layout = "no";
        variant = "winkeys";
    };
    programs.xwayland.enable = true;
    console.keyMap = "no";

    # CUPS
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    nixpkgs.config.allowUnfree = true;
}
