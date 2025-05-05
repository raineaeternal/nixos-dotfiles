{ pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        rustup
        rustc
        cargo
    ];
}
