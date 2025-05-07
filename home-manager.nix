{
    inputs,
    username,
    ...
}: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-backup";
        users.${username}.home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "24.11";
        };
    };
}
