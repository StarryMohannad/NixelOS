{ pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;  
 home.packages = with pkgs; [
   keepassxc

   mpc-cli
   mpv
   nomacs
   xfce.thunar
   zathura

   (nerdfonts.override { fonts = [ "FiraCode" ]; })
   kawkab-mono-font

   dconf
   syncthing

   scrcpy
   betterdiscordctl
 ];
}
