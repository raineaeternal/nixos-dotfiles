{
    description = "Nikki's nix config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
        just-one-more-repo = {
            url = "github:ProverbialPennance/just-one-more-repo";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        aagl = {
            url = "github:ezKEa/aagl-gtk-on-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
          self, nixpkgs, chaotic, just-one-more-repo, aagl, ...
      } @ inputs: {
        nixosConfigurations.nikki = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
            modules = [
                aagl.nixosModules.default
                just-one-more-repo.nixosModules.default
                chaotic.nixosModules.default
                ./cachix.nix
                ./kernel.nix
                ./auto-update.nix
                ./install-state.nix
                ./system.nix
                ./hardware-configuration.nix
                ./users.nix
                ./font.nix
                ./nvidia.nix
                ./ubnt.nix
                ./plasma.nix
                ./programming/rust.nix
                ./programming/node.nix
                ./programming/csharp.nix
            ];
        };
    };
}
