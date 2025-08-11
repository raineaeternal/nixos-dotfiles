{pkgs,...}: {
  environment.systemPackages = with pkgs; [
    archipelago
    poptracker
    retroarch
  ];
}
