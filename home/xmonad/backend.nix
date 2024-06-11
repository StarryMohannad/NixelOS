{ config, pkgs, ... }:

{
 xdg.mime.enable = true;
 xdg.mimeApps.enable = true;

 xdg.mimeApps.defaultApplications = {
   "applications/pdf" = [ "zathura.desktop" ];
   "image/*"          = [ "nsxiv.desktop" ];
   "video/*"          = [ "mpv.desktop" ];
 };

 services.dunst.enable = true;
 services.trayer.enable = true;
 
 programs.rofi.enable = true;
 programs.rofi.font = "FiraCode Nerd Font 12"; 
}
