{ pkgs, ... }:

let
  # Extend pkgs to override nightfox-gtk-theme
  customPkgs = pkgs.extend (self: super: {
    nightfox-gtk-theme = super.nightfox-gtk-theme.override {
      colorVariants = [ "dark" ];
      sizeVariants = [ "standard" ];
      themeVariants = [ "red" ];
      tweakVariants = [ "outline" ];
      iconVariants = [ "Duskfox" ];
    };
  });
in {
  environment.variables = {
    GTK_THEME = "nightfox-dark-standard-default";
    XCURSOR_THEME = "nightfox-dark";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "nightfox-dark";
    HYPRCURSOR_SIZE = "24";
  };

  console = {
    earlySetup = true;
    colors = [
      "2e3440" "bf616a" "a3be8c" "ebcb8b"
      "81a1c1" "b48ead" "88c0d0" "e5e9f0"
      "4c566a" "bf616a" "a3be8c" "ebcb8b"
      "81a1c1" "b48ead" "88c0d0" "eceff4"
    ];
  };

  environment.systemPackages = with customPkgs; [
    gtk2 gtk3 gtk4
    nightfox-gtk-theme
  ];
}
