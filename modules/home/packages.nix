{ pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;  
 home.packages = with pkgs; [
   aseprite
   gimp
   kdenlive
   obs-studio

   (discord.override { withVencord = true; })
   keepassxc

   mpc-cli
   neofetch
   nitch
   pfetch
   screenfetch

   brightnessctl
   pamixer
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
   wl-clipboard

   rofi-bluetooth
   scrcpy

   grim
   slurp   
   swappy

   wttrbar
   wofi-emoji
 ];

 programs.mangohud.enable = true;
}
