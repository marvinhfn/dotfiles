{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nvix.url = "github:anders130/nvix";
    };
    outputs = inputs: {
        nixosConfigurations.Reschner = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
            ];
            specialArgs = {
                inherit inputs;
            };
        };
    };
}

