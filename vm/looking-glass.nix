{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        looking-glass-client  
    ];
}