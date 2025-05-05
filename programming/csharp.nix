{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pkgs.dotnetCorePackages.dotnet_9.sdk
    ];
}
