{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [
   mpc-cli
   mpv
   nomacs
   xfce.thunar
   zathura

   keepassxc
   vesktop
 ];
}

