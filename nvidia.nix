{ pkgs, hardware, inputs, config, ... }: {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        open = true;
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        nvidiaSettings = true;
    };
}
