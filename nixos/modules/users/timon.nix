{self, ...}: {

  flake.nixosModules.timonModule = {config, pkgs, ...}: {

  home-manager.users.timon = {
    home.username = "timon";
    home.homeDirectory = "/home/timon";
    home.stateVersion = "25.11";

    programs.git = {
      enable = true;
      userName = "Timon Jurschitsch";
      userEmail = "timon.jurschitsch@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
        rebase.autoStash = true;
        push.autoSetupRemote = true;
        merge.conflictstyle = "zdiff3";
        core.editor = "nvim";
      };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };

    home.packages = with pkgs; [
      starship
      neovim
      tmux
      yazi
      wezterm
      gh
      delta
      fzf
      zoxide
      eza
      bat
      btop
      zellij
      atuin
      sesh
      gum
      graphite-cli
      yaak
    ];

    xdg.configFile."nvim".source = /home/timon/.dotfiles/nvim;
    xdg.configFile."atuin".source = /home/timon/.dotfiles/atuin;
    xdg.configFile."bat".source = /home/timon/.dotfiles/bat;
    home.file.".tmux.conf".source = /home/timon/.dotfiles/tmux/tmux.conf;

    # If you want live editing without rebuilding, change the above to use:
    # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/timon/.dotfiles/nvim";
    # But for that to work, the home-manager.users.timon block must accept config as an argument:
    # home-manager.users.timon = { config, ... }: {
    };
  };
}
