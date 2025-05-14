{
    environment.shellAliases.rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#Reschner";
    environment.shellAliases.reboooot = "reboot";
    environment.shellAliases.logoff = "hyprctl dispatch exit";
}
