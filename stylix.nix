{
    inputs,
    pkgs,
    ...
}: {
    imports = [inputs.stylix.nixosModules.stylix];
    stylix = {
        enable = true;
        image = ./wallpaper.jpg;
        cursor = {
            name = "catppuccin-macchiato-dark-cursors";
            size = 24;
            package = pkgs.catppuccin-cursors.macchiatoDark;
        };
        polarity = "dark";
    };
    environment.systemPackages = with pkgs; [
        swww
    ];
}
