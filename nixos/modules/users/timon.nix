# Shared user configuration (Home Manager module)
_: {
  flake.homeModules.timonShared = {config, ...}: {
    home = {
      username = "timon";
      homeDirectory = "/home/timon";
      stateVersion = "26.05";
    };

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Timon Jurschitsch";
          email = "timon.jurschitsch@gmail.com";
        };
        init.defaultBranch = "main";
        rebase.autoStash = true;
        push.autoSetupRemote = true;
        merge.conflictstyle = "zdiff3";
        core.editor = "nvim";
        core.pager = "delta";
        delta.navigate = true;
        delta.dark = true;
        interactive.diffFilter = "delta --color-only";
      };
    };

    xdg.configFile = {
      "nvim".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/nvim;
      "atuin".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/atuin;
      "bat".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/bat;
      "yazi".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/yazi;
      "sesh".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/sesh;
      "wezterm".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/wezterm;
      "gh-dash".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/gh-dash;
      "zed".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/zed;
      "niri".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/niri;
      "starship.toml".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/starship/starship.toml;
    };
    home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/tmux/tmux.conf;
  };
}
