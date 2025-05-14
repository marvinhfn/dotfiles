{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nvix.url = "github:anders130/nvix";
        your-shell.url = "github:anders130/my-shell";
        home-manager = {
            url = "github:nix-community/home-manager?ref=release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland = {
            type = "git";
            url = "https://github.com/hyprwm/Hyprland";
            ref = "refs/tags/v0.47.1";
            submodules = true;
        };
        split-monitor-workspaces = {
            url = "github:Duckonaut/split-monitor-workspaces?rev=a8e39ff10dfb5ff451416a791a30388a8517e038";
            inputs.hyprland.follows = "hyprland";
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
