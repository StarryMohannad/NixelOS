{ pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;  
 home.packages = with pkgs; [
   aseprite
   gimp
   kdenlive
   obs-studio

   keepassxc

   mpc-cli
   neofetch
   nitch
   pfetch
   screenfetch

   mpc-cli
   neofetch

   mpv
   nomacs
   xfce.thunar
   zathura

   crispy-doom
   dolphin-emu
   doomrunner
   duckstation
   gzdoom
   pcsx2
   prismlauncher

   (nerdfonts.override { fonts = [ "FiraCode" ]; })
   kawkab-mono-font

   dconf
   syncthing

   rofi-bluetooth
   scrcpy
   betterdiscordctl
 ];

 programs.mangohud.enable = true;
}
