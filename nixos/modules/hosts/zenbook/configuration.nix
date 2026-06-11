{self, inputs, ...}: {

  flake.nixosModules.zenbookModule = {pkgs, ...}: {
    imports = [
      self.nixosModules.sharedConfig
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  # boot.loader.grub = {
  #   enabled = true;
  #   devices = ["/dev/nvme0n1"];
  #   efiSupport = true;
  # };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zenbook"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.getty.autologinUser = "timon";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.timon = {
    isNormalUser = true;
    description = "timon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    };
# programs.hyprland = {
#     enable = true;
#     withUWSM = true;
#     xwayland.enable = true;
#   };
  programs.localsend.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      icu
    ];
  };

  programs.git = {
      enable = true;
      # settings = {
      #     user = {
      #         name = "Timon Jurschitsch";
      #         email = "timon.jurschitsch@gmail.com";
      #       };
      #     init.defaultBranch = "main";
      #     push = { autoSetupRemote = true; };
      #   };
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    brave
    go
    gcc
    rustup
    fnm
    slack
    deezer-desktop
    proton-pass
    tailscale
  ];

  virtualisation.docker = {
    enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  };
}
