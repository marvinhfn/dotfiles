{
    services.sunshine = {
        enable = true;
        autoStart = false; # otpional
        capSysAdmin = true; # wayland braucht das!
        openFirewall = true;
    };

    # vpn verbindung mit mir:
    services.tailscale.enable = true;
}
