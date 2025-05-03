{config, ...}:
{
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    nvidia = {
	modesetting.enable = true;
	open = true;
	powerManagement.enable = true;
	nvidiaSettings = true;
	nvidiaPersistenced = true;
	package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
          version = "570.133.07";
          sha256_64bit = "sha256-LUPmTFgb5e9VTemIixqpADfvbUX1QoTT2dztwI3E3CY=";
          sha256_aarch64 = "sha256-yTovUno/1TkakemRlNpNB91U+V04ACTMwPEhDok7jI0=";
          openSha256 = "sha256-9l8N83Spj0MccA8+8R1uqiXBS0Ag4JrLPjrU3TaXHnM=";
          settingsSha256 = "sha256-XMk+FvTlGpMquM8aE8kgYK2PIEszUZD2+Zmj2OpYrzU=";
          persistencedSha256 = "sha256-G1V7JtHQbfnSRfVjz/LE2fYTlh9okpCbE4dfX9oYSg8=";
    };
    };

    graphics = {
	enable = true;
	enable32Bit = true;
    };
  };
}
