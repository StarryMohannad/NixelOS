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

   bat
   eza
   mpc-cli
   neofetch
   nitch
   pfetch
   screenfetch
   zoxide

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
   xclip
   xsel

   gxmessage
   xwallpaper
   xcompmgr
   xdotool

   xmobar
 ];
}
