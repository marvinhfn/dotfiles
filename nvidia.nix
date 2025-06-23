{config, pkgs, ...}: {
    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
        nvidia = {
            modesetting.enable = true;
            open = true;
            powerManagement.enable = true;
            nvidiaSettings = true;
            nvidiaPersistenced = true;
            package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "570.153.02";
      sha256_64bit = "sha256-FIiG5PaVdvqPpnFA5uXdblH5Cy7HSmXxp6czTfpd4bY=";
      sha256_aarch64 = "sha256-FKhtEVChfw/1sV5FlFVmia/kE1HbahDJaxTlpNETlrA=";
      openSha256 = "sha256-2DpY3rgQjYFuPfTY4U/5TcrvNqsWWnsOSX0f2TfVgTs=";
      settingsSha256 = "sha256-5m6caud68Owy4WNqxlIQPXgEmbTe4kZV2vZyTWHWe+M=";
      persistencedSha256 = "sha256-OSo4Od7NmezRdGm7BLLzYseWABwNGdsomBCkOsNvOxA=";
      patches = [(
        # https://github.com/NVIDIA/open-gpu-kernel-modules/issues/840
        pkgs.fetchpatch {
          url = "https://github.com/CachyOS/kernel-patches/raw/914aea4298e3744beddad09f3d2773d71839b182/6.15/misc/nvidia/0003-Workaround-nv_vm_flags_-calling-GPL-only-code.patch";
          hash = "sha256-YOTAvONchPPSVDP9eJ9236pAPtxYK5nAePNtm2dlvb4=";
          stripLen = 1;
          extraPrefix = "kernel/";
        }
      )];
    };        };

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
