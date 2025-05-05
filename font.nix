{ pkgs, ... }: {
  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    cascadia-code
    # cascadia-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
