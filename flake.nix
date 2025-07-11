{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        nvix.url = "github:anders130/nvix";
        your-shell.url = "github:anders130/my-shell";
        home-manager = {
            url = "github:nix-community/home-manager?ref=release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprpanel.url = "github:jas-singhfsu/hyprpanel";
        hyprland = {
            type = "git";
            url = "https://github.com/hyprwm/Hyprland";
            ref = "refs/tags/v0.49.0";
            submodules = true;
        };
        split-monitor-workspaces = {
            url = "github:Duckonaut/split-monitor-workspaces";
            inputs.hyprland.follows = "hyprland";
        };
        stylix = {
            url = "github:danth/stylix/release-25.05";
            inputs = {
                home-manager.follows = "home-manager";
                nixpkgs.follows = "nixpkgs";
            };
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
