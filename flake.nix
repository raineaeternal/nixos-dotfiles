{
    description = "Nikki's nix config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
        just-one-more-repo.url = "github:ProverbialPennance/just-one-more-repo";
        aagl = {
            url = "github:ezKEa/aagl-gtk-on-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
          self, nixpkgs, chaotic, just-one-more-repo, aagl, astal, ...
      } @ inputs: let
        inherit (self) outputs;
        systems = ["x86_64-linux"];
        forAllSystems = nixpkgs.lib.genAttrs systems;
      in {
        formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
        nixosConfigurations.foxhole = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
              ./games
              ./hardware
              ./programs
              ./services
              ./system
              ./users
#              ./vm
              ./cachix.nix
              ./auto-update.nix
              aagl.nixosModules.default
              just-one-more-repo.nixosModules.default
              chaotic.nixosModules.default
          ];
        };

        nixosConfigurations.portable = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            ./games
            ./hardware
            ./programs
            ./services
            ./system
            ./users
            ./cachix.nix
            ./auto-update.nix
            aagl.nixosModules.default
            just-one-more-repo.nixosModules.default
            chaotic.nixosModules.default
          ];
        }
    };
}
