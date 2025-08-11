{pkgs, ...}: {
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      extraCompatPackages = with pkgs; [
          proton-ge-custom
      ];
      package = pkgs.steam.override {
          extraEnv = {
              PROTON_ENABLE_HDR = 1;
              OBS_VKCAPTURE = true;
          };
      };
  };
}
