{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24-11";
    };
    outputs = {nixpkgs}: {
        nixosConfigurations.Reschner = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
        ];
        };
    };
}

