{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
      
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set smarttab
      set lbr
      set tw=500
      set ai
      set si
      set wrap
    '';
  };
}

