{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true; # Enable for Zsh
    enableBashIntegration = true; # Enable for Bash
    settings = {
      # format = "❄️ $username$hostname";
    };
  };
}

