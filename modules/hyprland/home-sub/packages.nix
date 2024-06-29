{ config, pkgs, ...}:

{ 
 config.home.packages = with pkgs; [
   grim
   slurp   
   swappy

   wttrbar
   wofi-emoji
   wl-clipboard
   brightnessctl
   pamixer
 ];
}
