{ pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.fish;
        packages = with pkgs; [
            spotify
            discord
            vscodium
            code-cursor
            firefox
            # arc-browser
            # ghostty
            alacritty
            git
            #networkmanager-applet
            (xivlauncher-rb.override { 
                # useSteamRun = false; 
                useGameMode = true;
            })
            bitwarden
            obs-studio
            vlc
            vlc-bittorrent
            steam
            (zed-editor.fhsWithPackages(zedpkgs: with zedpkgs; [
               zlib
            ])
          )
        ];
    };

    programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        plugins = with pkgs; [
            obs-studio-plugins.obs-vkcapture
            obs-studio-plugins.obs-pipewire-audio-capture
            obs-studio-plugins.obs-vertical-canvas
            obs-studio-plugins.obs-teleport
            obs-studio-plugins.input-overlay
            obs-studio-plugins.obs-ndi
        ];
    };

    programs.fish.useBabelfish = true;

    services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
