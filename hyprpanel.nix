# *.nix
{
    inputs,
    username,
    ...
}: {
    home-manager.users.${username} = {
        imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

        programs.hyprpanel = {
            # Enable the module.
            # Default: false
            enable = true;

            # Add '/nix/store/.../hyprpanel' to your
            # Hyprland config 'exec-once'.
            # Default: false
            hyprland.enable = true;

            # Fix the overwrite issue with HyprPanel.
            # See below for more information.
            # Default: false
            overwrite.enable = true;


            # Override the final config with an arbitrary set.
            # Useful for overriding colors in your selected theme.
            # Default: {}
            # override = {
            #     theme.bar.menus.text = "#123ABC";
            # };

            # Configure and theme almost all options from the GUI.
            # Options that require '{}' or '[]' are not yet implemented,
            # except for the layout above.
            # See 'https://hyprpanel.com/configuration/settings.html'.
            # Default: <same as gui>
            settings = {
                bar.launcher.autoDetectIcon = true;
                bar.workspaces.show_icons = true;

                menus.clock = {
                    time = {
                        military = true;
                        hideSeconds = true;
                    };
                    weather.unit = "metric";
                };

                menus.dashboard.directories.enabled = false;
                menus.dashboard.stats.enable_gpu = true;

                theme.bar.transparent = true;

                theme.font = {
                    name = "CaskaydiaCove NF";
                    size = "16px";
                };
            };
        };
    };
}
