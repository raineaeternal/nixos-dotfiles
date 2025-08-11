{pkgs, ...}: {
  programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio.override {
          cudaSupport = true;
      };

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
}
