{ config, lib, pkgs, ... }:

{
 xdg.mime.enable = true;
 xdg.mimeApps.enable = true;

 xdg.mimeApps.defaultApplications = {
   "applications/pdf" = [ "zathura.desktop" ];
   "image/*"          = [ "nomacs.desktop" ];
   "video/*"          = [ "mpv.desktop" ];
 };
}
