{ config, pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
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
      gimp
      archipelago
      poptracker
      retroarch
      streamcontroller
      ryubing
      fflogs

      # browsers
      firefox
      brave

      # Code editors & dev
      code-cursor
      jetbrains.rider

      # terminal/git
      alacritty
      git
      ripgrep
      pciutils

      # perf monitoring
      mangohud

   	  zip
      unzip
      p7zip

      (zed-editor.fhsWithPackages(zedpkgs: with zedpkgs; [
         zlib
      ]))
    ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.xone.enable = true;

    services.openssh.enable = true;
    services.goxlr-utility.enable = true;
    services.tailscale.enable = true;

    services.logind.extraConfig = "RuntimeDirectorySize=8G";

    programs.obs-studio = {
        enable = true;
        package = pkgs.obs-studio.override {
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

    programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        ohMyZsh = {
            enable = true;
            plugins = [ "git" "sudo" ];
        };
        interactiveShellInit = ''
            export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
            ZSH_THEME="edvardm"

            source $ZSH/oh-my-zsh.sh
        '';

        promptInit = "";
    };

    programs.gamescope.enable = true;
    programs.gamemode.enable = true;
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        extraCompatPackages = with pkgs; [
            proton-ge-custom
        ];
    };

    programs.anime-game-launcher.enable = true;
    programs.honkers-railway-launcher.enable = true;
}
