{config, pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
      (xivlauncher-rb.override {
          useGameMode = true;
          nvngxPath = "${config.hardware.nvidia.package}/lib/nvidia/wine";
      })
      fflogs
  ];
}
