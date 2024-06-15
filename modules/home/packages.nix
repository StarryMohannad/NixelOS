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
   hacksaw
   pamixer
   shotgun

   mpv
   nsxiv
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

   hyprpaper
 ];

 programs.mangohud.enable = true;
}
