{
    description = "Nikki's nix config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
        nixos-xivlauncher-rb = {
            url = "github:ProverbialPennance/nixos-xivlauncher-rb";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, chaotic, nixos-xivlauncher-rb, ... } @ inputs: {
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
                chaotic.nixosModules.default
            ];
        };
    };
}
