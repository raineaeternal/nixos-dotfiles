{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (zed-editor.fhsWithPackages(zedpkgs: with zedpkgs; [
       zlib
    ]))
    jetbrains.rider
    jetbrains.rust-rover

    alacritty
    git
    ripgrep
    pciutils
    filezilla
  ];
}
