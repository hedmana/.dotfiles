{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "knappen";
  home.homeDirectory = "/home/knappen";

  programs.git = {
    enable = true;
    userName = "Axel Hedman";
    userEmail = "axelhedman00@gmail.com";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Modules
  imports = [
    ./modules/vim.nix
    ./modules/alacritty.nix
    ./modules/starship.nix
  ];

  home.packages = with pkgs; [
    hello
    neofetch
    vscode
    ranger
    texliveFull
    nerdfonts
    spotify
    discord
    telegram-desktop

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vscode";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  # Bash config
  programs.bash.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Custom keybindings for GNOME
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    # Alacritty
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Open Terminal";
      binding = "<Super>t";
      command = "alacritty";
      type = "application";
    };

    # Firefox
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Open Firefox";
      binding = "<Super>f";
      command = "firefox";
      type = "application";
    };
  };
}
