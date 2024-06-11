{ config, pkgs, ... }:

{
 xdg.mimeApps.defaultApplications = {
   "applications/pdf" = [ "zathura.desktop" ];
   "image/*"          = [ "nsxiv.desktop" ];
   "video/*"          = [ "mpv.desktop" ];
 };
}
