{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.niri}/bin/niri-session";
      user = "foxxy";
    };
  };

  services.dbus.enable = true;
  security.polkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    fuzzel mako wl-clipboard
    grim slurp swaylock-effects
    gnome-keyring
    kdePackages.dolphin
  ];

  environment.sessionVariables = {
    OZONE_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
  };
}
