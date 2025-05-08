{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nvix.url = "github:anders130/nvix";
        your-shell.url = "github:anders130/my-shell";
        home-manager = {
            url = "github:nix-community/home-manager?ref=release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = inputs: {
        nixosConfigurations.Reschner = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
            ];
            specialArgs = {
                inherit inputs;
                username = "marvhae";
            };
        };
    };
}
