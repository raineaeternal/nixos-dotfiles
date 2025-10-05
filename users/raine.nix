{ config, pkgs, ... }: {
    users.users.foxxy = {
        isNormalUser = true;
        description = "foxxy";
	extraGroups = ["networkmanager" "input" "wheel" "video" "audio" "tss"];
        uid = 1000;
        shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
      # Leisure
      discord
      # teamspeak3
      bitwarden
      vlc
      # vlc-bittorrent

      # browsers
      firefox
      brave

   	  zip
      unzip
      p7zip
    ];
}
