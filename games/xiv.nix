{config, pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
      (xivlauncher-rb.override {
          useGameMode = true;
      })
      fflogs
  ];
}
