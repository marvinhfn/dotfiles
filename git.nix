{username, ...}: {
    home-manager.users.${username}.programs.git = {
        enable = true;
        userName = "marvinhfn";
        userEmail = "110218796+marvinhfn@users.noreply.github.com";
    };
}
