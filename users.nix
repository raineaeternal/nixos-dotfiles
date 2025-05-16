{ pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.fish;
        packages = with pkgs; [
            # Leisure
            spotify
            discord
            xivlauncher-rb
            bitwarden
            vlc
            vlc-bittorrent
            steam
            obs-studio
            gimp

            # browsers
            firefox
            brave

            # Code editors & dev
            vscodium
            code-cursor

            # terminal/git
            alacritty
            git

            # perf monitoring
            mangohud

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
