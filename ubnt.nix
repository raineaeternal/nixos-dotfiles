{ pkgs, ...}: {
  services.unifi = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    unifi
  ];
}
