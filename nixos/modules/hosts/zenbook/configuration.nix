{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.zenbookModule = {pkgs, ...}: {
    imports = [
      self.nixosModules.sharedConfig
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "zenbook"; # Define your hostname.
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
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        zlib
        openssl
        icu
      ];
    };

    virtualisation.docker = {
      enable = true;
    };
  };
}
