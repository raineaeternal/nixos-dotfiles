{ config, pkgs, ... }: {
    users.users.nikki = {
        isNormalUser = true;
        description = "raine";
        extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
      # Leisure
      discord
      teamspeak3
      bitwarden
      vlc
      vlc-bittorrent

      # browsers
      firefox
      brave

   	  zip
      unzip
      p7zip
    ];
}
