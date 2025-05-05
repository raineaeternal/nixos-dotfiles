{ pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.fish;
        packages = with pkgs; [
            spotify
            slack
            discord
            vscodium
            code-cursor
            firefox
            # arc-browser
            # ghostty
            alacritty
            git
            #networkmanager-applet
            rofi
            xivlauncher
            bitwarden
            obs-studio
            grim
       	    slurp
            vlc
            vlc-bittorrent
            kdePackages.dolphin
            kdePackages.qt6gtk2
            kdePackages.qt6ct
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
    programs.thunar.enable = true;
}
