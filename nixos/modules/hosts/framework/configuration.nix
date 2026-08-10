{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.frameworkModule = {pkgs, ...}: {
    imports = [
      self.nixosModules.sharedConfig
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "framework"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    services.getty.autologinUser = "timon";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.timon = {
      isNormalUser = true;
      description = "timon";
      extraGroups = ["networkmanager" "wheel" "docker"];
      packages = with pkgs; [
        #  thunderbird
      ];
    };

    users.defaultUserShell = pkgs.zsh;
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
      };
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc
          zlib
          openssl
          icu
        ];
      };

      gamemode.enable = true;
      steam = {
        enable = true;
      };
      gamescope = {
        enable = true;
        enableWsi = true;
        capSysNice = false;
      };
    };
    programs.dms-shell = {
      enable = true;

      systemd = {
        enable = true; # Systemd service for auto-start
        restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
      };

      # Core features
      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
    };

    virtualisation.docker = {
      enable = true;
    };
  };
}
