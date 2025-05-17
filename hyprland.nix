{
    username,
    inputs,
    pkgs,
    ...
}: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
   home-manager.users.${username} = {config, ...}: {
        xdg.configFile."hypr/extra.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/${username}/.dotfiles/hyprland.conf";
        imports = [inputs.hyprland.homeManagerModules.default];

        wayland.windowManager.hyprland = {
            enable = true;
            xwayland.enable = true;

            settings = {
                general = {
                    layout = "dwindle";
                    allow_tearing = false;
                };
                dwindle.preserve_split = true;
                gestures.workspace_swipe = false;
                ecosystem.no_update_news = true;
            };

            extraConfig = ''
                source = ./extra.conf
                plugin {
                    split-monitor-workspaces {
                        count = 10
                        keep_focused = 0
                        enable_notifications = 0
                        enable_persistent_workspaces = 0
                    }
                }
            '';

            # tell systemd to import environment by default (fixes screenshare)
            systemd.variables = ["--all"];

            plugins = [(inputs.split-monitor-workspaces.packages.${pkgs.system}.default)];
        };
    };
    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config.hyprland.default = [
            "hyprland"
            "gtk"
        ];
    };
}
