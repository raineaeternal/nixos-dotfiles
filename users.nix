{ config, pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.fish;
        packages = with pkgs; [
            # Leisure
            spotify
            discord
            (xivlauncher-rb.override {
                useGameMode = true;
                nvngxPath = "${config.hardware.nvidia.package}/lib/nvidia/wine";
            })
            bitwarden
            vlc
            vlc-bittorrent
            steam
            obs-studio
            gimp
            archipelago
            poptracker
            retroarch
            goxlr-utility

            # Other tools
            tailscale
            woeusb-ng

            # browsers
            firefox
            brave

            # Code editors & dev
            code-cursor
            jetbrains.rider

            # terminal/git
            alacritty
            git

            # perf monitoring
            mangohud

      (zed-editor.fhsWithPackages(zedpkgs: with zedpkgs; [
         zlib
      ]))
    ];

    programs.obs-studio = {
        enable = true;
        pkgs.obs-studio.override {
            cudaSupport = true;
        };

        enableVirtualCamera = true;
        plugins = with pkgs; [
            obs-studio-plugins.obs-vkcapture
            obs-studio-plugins.obs-pipewire-audio-capture
    #        obs-studio-plugins.obs-vertical-canvas
            obs-studio-plugins.obs-teleport
            obs-studio-plugins.input-overlay
            obs-studio-plugins.obs-ndi
        ];
    };

    programs.fish.useBabelfish = true;
    hardware.xone.enable = true;

    services.goxlr-utility.enable = true;

    services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
