{username, ...}: {
    home-manager.users.${username} = {config, ...}: {
        stylix.targets.wofi.enable = false;
        programs.wofi = {
            enable = true;
            settings = {
                columns = 7;
                width = 1800;
                height = 800;
                allow_images = true;
            };
            style = ''
                @import url("/home/${username}/.config/wofi/extra.css");
            '';
        };
        xdg.configFile."wofi/extra.css".source = config.lib.file.mkOutOfStoreSymlink "/home/${username}/.dotfiles/wofi/style.css";
    };
}
