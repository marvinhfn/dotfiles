{
    config,
    pkgs,
    ...
}: {
    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
        nvidia = {
            modesetting.enable = true;
            open = true;
            powerManagement.enable = true;
            nvidiaSettings = true;
            nvidiaPersistenced = true;
            package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
                version = "570.169";
                sha256_64bit = "sha256-XzKoR3lcxcP5gPeRiausBw2RSB1702AcAsKCndOHN2U=";
                sha256_aarch64 = "sha256-s8jqaZPcMYo18N2RDu8zwMThxPShxz/BL+cUsJnszts=";
                openSha256 = "sha256-oqY/O5fda+CVCXGVW2bX7LOa8jHJOQPO6mZ/EyleWCU=";
                settingsSha256 = "sha256-0E3UnpMukGMWcX8td6dqmpakaVbj4OhhKXgmqz77XZc=";
                persistencedSha256 = "sha256-dttFu+TmbFI+mt1MbbmJcUnc1KIJ20eHZDR7YzfWmgE=";
            };
        };

        graphics = {
            enable = true;
            enable32Bit = true;
        };
    };
    boot.kernelParams = [
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
        "initcall_blacklist=simpledrm_platform_driver_init"
    ];
    environment.systemPackages = with pkgs; [egl-wayland nvidia-system-monitor-qt];
}
