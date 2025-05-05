{
    description = "Nikki's nix config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        hyprland.url = "github:hyprwm/Hyprland";
        nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    };

    outputs = { self, nixpkgs, nixos-cosmic, ... } @ inputs: {
        nixosConfigurations.nikki = nixpkgs.lib.nixosSystem {
	    specialArgs = { inherit inputs; };
            modules = [
              	{
              	    nix.settings = {
               		   	  substituters = ["https://cosmic.cachix.org/"];
                 		    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
              	    };
              	}
              	nixos-cosmic.nixosModules.default
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
                ./cosmic.nix
                ./programming/rust.nix
                ./programming/node.nix
                ./programming/csharp.nix

            ];
        };
    };
}
