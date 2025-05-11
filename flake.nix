{
    description = "Nikki's nix config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixos-xivlauncher-rb = {
            url = "github:drakon64/nixos-xivlauncher-rb";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixos-xivlauncher-rb, ... } @ inputs: {
        nixosConfigurations.nikki = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
            modules = [
                ./install-state.nix
                ./system.nix
                ./hardware-configuration.nix
                ./theme.nix
                ./terminal.nix
                ./users.nix
                ./font.nix
                ./programs.nix
                ./nvidia.nix
                ./ubnt.nix
                ./plasma.nix
                ./programming/rust.nix
                ./programming/node.nix
                ./programming/csharp.nix
                nixos-xivlauncher-rb.nixosModules.default
            ];
        };
    };
}
